// Setup type definitions for built-in Supabase Runtime APIs
/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.7.1";
import { handleError, handleSuccess } from "../_shared/response.mapper.ts";

class SendMessageRequest {
  conversationId: number;
  message: string;
}

Deno.serve(async (req: Request) => {
  const request: SendMessageRequest = await req.json();
  if (!request.conversationId || !request.message) {
    return handleError("Invalid request", 400);
  }

  try {
    const supabaseClient = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_ANON_KEY") ?? "",
      {
        global: {
          headers: { Authorization: req.headers.get("Authorization")! },
        },
      },
    );

    const token = req.headers.get("Authorization")?.replace("Bearer ", "");

    const {
      data: { user },
    } = await supabaseClient.auth.getUser(token);

    const { data: usersSettings, error: settingsError } = await supabaseClient
      .from("user_settings")
      .select("groq_api_key")
      .eq("user_id", user?.id ?? 1)
      .single();

    if (!usersSettings?.groq_api_key || settingsError) {
      return handleError("Please set your Groq API key in the settings", 400);
    }

    const { data: conversation, error } = await supabaseClient
      .from("conversations")
      .select("id")
      .eq("id", request.conversationId)
      .single();

    if (error) {
      return handleError("Conversation not found", 500);
    }

    const requestMessage = {
      content: request.message,
      role: "user",
    };

    const { error: messageError } = await supabaseClient
      .from("messages")
      .insert({
        conversation_id: conversation.id,
        user_id: user?.id,
        ...requestMessage,
      });

    if (messageError) {
      return handleError(messageError.message, 500);
    }

    const payload = {
      messages: [
        requestMessage,
      ],
      model: conversation.model ?? "mixtral-8x7b-32768",
      temperature: 1,
      "top_p": 1,
      stream: false,
      stop: null,
    };

    const modelResponse = await fetch(
      "https://api.groq.com/openai/v1/chat/completions",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${usersSettings.groq_api_key}`,
        },
        body: JSON.stringify(payload),
      },
    ).then((res) => res.json());

    if (!modelResponse) {
      return handleError("Failed to query AI model", 500);
    }

    const answer = modelResponse.choices[0].message;

    const { data: aiResponseMessage, error: responseError } =
      await supabaseClient
        .from("messages")
        .insert({
          conversation_id: conversation.id,
          user_id: user?.id,
          content: answer.content,
          role: answer.role,
        })
        .select();

    if (responseError) {
      return handleError(responseError.message, 500);
    }

    return handleSuccess({
      answer: aiResponseMessage,
    });
  } catch (error) {
    return handleError(error.message, 500);
  }
});

// Setup type definitions for built-in Supabase Runtime APIs
/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />
import Groq from "https://esm.sh/groq";
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

    if (settingsError) {
      return handleError(settingsError.message, 500);
    }

    // 1. Get the conversation
    const { data: conversation, error } = await supabaseClient
      .from("conversations")
      .select("id")
      .eq("id", request.conversationId)
      .single();

    if (error) {
      return handleError(error.message, 500);
    }

    const requestMessage = {
      content: request.message,
      role: "user",
    };

    // 2. Create a new message
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

    // 3. Query ai model
    const groqClient = new Groq({
      apiKey: usersSettings.groq_api_key,
    });

    const chatCompletion = await groqClient.chat.completions.create({
      messages: [
        requestMessage,
      ],
      model: conversation.model ?? "mixtral-8x7b-32768",
      temperature: 1,
      "top_p": 1,
      stream: false,
      stop: null,
    });

    console.log(chatCompletion);

    return handleSuccess({
      response: chatCompletion.choices[0].message,
    });
  } catch (error) {
    return handleError(error.message, 500);
  }
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/completions' \
    --header 'Authorization: Bearer ' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/

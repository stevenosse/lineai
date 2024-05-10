// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.7.1";
import {
  CompletionMessage,
  CompletionRequest,
  RegenerateCompletionRequest,
} from "../_shared/models.ts";
import { handleError, handleSuccess } from "../_shared/response.mapper.ts";
import { getPromptForStyle, getPromptForTone } from "../_shared/utils.ts";

// Setup type definitions for built-in Supabase Runtime APIs
/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />

console.log("Hello from Functions!");

Deno.serve(async (req) => {
  const request: RegenerateCompletionRequest = await req.json();
  if (!request.messageId) {
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

    const { data: message, error: messageError } = await supabaseClient
      .from("messages")
      .select("*")
      .eq("id", request.messageId)
      .maybeSingle();

    if (!message || messageError) {
      return handleError(
        "The message you're trying to regenerate an answer for does not exist",
        500,
      );
    }

    // If no corresponding entry exists with the message.id as answered_message_id, then
    // this message has never been answered.
    const { data: previousAnswer, error: previousAnswerError } =
      await supabaseClient
        .from("messages")
        .select()
        .eq("answered_message_id", message.id)
        .maybeSingle();

    if (!previousAnswer || previousAnswerError) {
      return handleError(
        "The message you're trying to regenerate an answer for has not been answered yet or cannot be regenerated",
        400,
      );
    }

    const { data: conversation, error: conversationError } =
      await supabaseClient
        .from("conversations")
        .select("*")
        .eq("id", message.conversation_id)
        .single();

    if (!conversation || conversationError) {
      return handleError("Conversation not found", 404);
    }

    const messages: CompletionMessage[] = [];

    if (conversation.system_prompt) {
      messages.push({ role: "system", content: conversation.system_prompt });
    }

    if (conversation.summary) {
      messages.push({
        role: "system",
        content:
          `Here is a summary of the conversation: ${conversation.summary}`,
      });
    }

    const toneSystemPrompt = getPromptForTone(request.tone);
    const styleSystemPrompt = getPromptForStyle(request.style);

    if (toneSystemPrompt) {
      messages.push({ role: "system", content: toneSystemPrompt });
    }

    if (styleSystemPrompt) {
      messages.push({ role: "system", content: styleSystemPrompt });
    }

    messages.push({ role: "user", content: message.content });

    const payload = {
      messages: messages,
      model: conversation.model ?? "mixtral-8x7b-32768",
      temperature: conversation.temperature ?? 1,
      top_p: 1,
      stream: false,
    } as CompletionRequest;

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

    const answer = modelResponse.choices[0].message;
    const { data: aiResponseMessage, error: responseError } =
      await supabaseClient
        .from("messages")
        .update({
          content: answer.content,
          role: previousAnswer.role,
        })
        .eq("answered_message_id", message.id)
        .select()
        .single();

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

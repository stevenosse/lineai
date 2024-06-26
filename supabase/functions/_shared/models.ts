export class CompletionMessage {
  role: "user" | "system" | "assistant";
  content: string;
}

// Requests
export class CompletionRequest {
  messages: CompletionMessage[];
  model: string;
  temperature: number;
  top_p: number;
  stream: boolean;
  stop?: number | null;
}

export class SendMessageRequest {
  conversationId: number;
  message: string;
}

export class RegenerateCompletionRequest {
  messageId: number;
  tone: "professional" | "educator" | "friendly" | "neutral" | null;
  style: "bulleted" | "expanded" | "sentence" | null;
}

// Entities
export class ConversationEntity {
  id: number;
  summary: string;
  system_prompt: string;
  model: string;
  name: string;
}

export class MessageEntity {
  id: number;
  content: string;
  role: "user" | "system" | "assistant";
  conversation_id: number;
  user_id: number;
  answered_message_id: number | null;
}

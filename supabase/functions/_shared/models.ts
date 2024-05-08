export class CompletionMessage {
  role: "user" | "system" | "assistant";
  content: string;
}

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
}
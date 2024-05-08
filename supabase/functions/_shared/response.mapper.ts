import { corsHeaders } from "./cors.ts";

export function handleError(message: string, code: number): Response {
  return new Response(JSON.stringify({ error: message }), {
    headers: { ...corsHeaders, "Content-Type": "application/json" },
    status: code,
  });
}

export function handleSuccess(data: any, code: number = 200): Response {
  return new Response(JSON.stringify({ data }), {
    headers: { ...corsHeaders, "Content-Type": "application/json" },
    status: code,
  });
}

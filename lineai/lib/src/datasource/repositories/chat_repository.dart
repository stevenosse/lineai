import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/api_response/api_response.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/datasource/models/send_message_response/send_message_response.dart';
import 'package:lineai/src/datasource/repositories/base_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRepository extends BaseRepository {
  final SupabaseClient _supabaseClient;

  ChatRepository({
    SupabaseClient? supabaseClient,
  }) : _supabaseClient = supabaseClient ?? Supabase.instance.client;

  Stream<List<Conversation>> getConversations() {
    return _supabaseClient.from(DBConstants.conversationsTable).stream(
        primaryKey: ['id']).map((event) => event.map<Conversation>((json) => Conversation.fromJson(json)).toList());
  }

  Stream<List<Message>> getMessagesStream({required int conversationId}) {
    return _supabaseClient
        .from(DBConstants.messagesTable)
        .stream(primaryKey: ['id'])
        .eq('conversation_id', conversationId)
        .order('created_at', ascending: false)
        .map((event) => event.map<Message>((json) => Message.fromJson(json)).toList());
  }

  Future<ApiResponse<Conversation, ApiError>> createConversation({required Conversation conversation}) async {
    return runOperation(call: () async {
      final json = await _supabaseClient
          .from(DBConstants.conversationsTable)
          .upsert({...conversation.toJson(), 'user_id': _supabaseClient.auth.currentUser!.id})
          .select()
          .single();
      return ApiResponse.success(Conversation.fromJson(json));
    });
  }

  Future<ApiResponse<SendMessageResponse, ApiError>> sendMessage({
    required int conversationId,
    required String message,
  }) async {
    return runOperation(call: () async {
      final Conversation conversation = await _supabaseClient
          .from(DBConstants.conversationsTable)
          .select()
          .eq('id', conversationId)
          .single()
          .then((value) => Conversation.fromJson(value));

      await _supabaseClient.functions.invoke('completions', body: {
        'conversationId': conversation.id,
        'message': message,
      });

      return ApiResponse.success(SendMessageResponse(conversationId: conversation.id));
    });
  }
}

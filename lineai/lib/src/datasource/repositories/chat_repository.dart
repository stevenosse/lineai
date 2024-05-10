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
        .order('created_at', ascending: true)
        .map((event) => event.map<Message>((json) => Message.fromJson(json)).toList());
  }

  Future<ApiResponse<Conversation, ApiError>> createConversation({required Conversation conversation}) async {
    return runOperation(call: () async {
      final json = await _supabaseClient
          .from(DBConstants.conversationsTable)
          .upsert({
            ...conversation.toJson()..removeWhere((key, value) => value == null),
            'user_id': _supabaseClient.auth.currentUser!.id
          })
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

      final payload = {
        'conversationId': conversation.id,
        'message': message,
      };

      await _supabaseClient.functions.invoke('completions', body: payload);

      return ApiResponse.success(SendMessageResponse(conversationId: conversation.id!));
    });
  }

  Future<ApiResponse<bool, ApiError>> deleteMessage({required Message message}) async {
    return runOperation(call: () async {
      await _supabaseClient.from(DBConstants.messagesTable).delete().eq('id', message.id);

      // If the conversation is empty, delete it
      final messages =
          await _supabaseClient.from(DBConstants.messagesTable).select().eq('conversation_id', message.conversationId);
      if (messages.isEmpty) {
        await _supabaseClient.from(DBConstants.conversationsTable).delete().eq('id', message.conversationId);
      }

      return ApiResponse.success(true);
    });
  }

  Future<ApiResponse<bool, ApiError>> deleteConversation({required int conversationId}) async {
    return runOperation(call: () async {
      // TODO: Use a transaction to delete messages and conversation when the feature will be available
      await _supabaseClient.from(DBConstants.messagesTable).delete().eq('conversation_id', conversationId);

      await _supabaseClient.from(DBConstants.conversationsTable).delete().eq('id', conversationId);

      return ApiResponse.success(true);
    });
  }

  Future<ApiResponse<bool, ApiError>> regenerateAnswer({required int messageId}) async {
    return runOperation(call: () async {
      await _supabaseClient.functions.invoke('regenerate-completion', body: {'messageId': messageId});

      return ApiResponse.success(true);
    });
  }
}

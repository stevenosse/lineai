import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';
import 'package:lineai/src/datasource/repositories/base_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRepository extends BaseRepository {
  final SupabaseClient _supabaseClient;

  ChatRepository({
    SupabaseClient? supabaseClient,
  }) : _supabaseClient = supabaseClient ?? Supabase.instance.client;

  Stream<List<Conversation>> getConversations() {
    return _supabaseClient.from(DBConstants.conversationsTable).stream(primaryKey: ['id']).map(
      (event) => event.map<Conversation>((json) => Conversation.fromJson(json)).toList(),
    );
  }
}

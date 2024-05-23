import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/shared/locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(const ChatState.unsaved());

  String get userId => Supabase.instance.client.auth.currentUser!.id;

  void onModelChanged(String model) {
    late Conversation conversation =
        state.conversation == null ? Conversation(userId: '', createdAt: DateTime.now()) : state.conversation!;
    emit(ChatState.unsaved(conversation: conversation.copyWith(model: model)));
  }

  void onSystemPromptChanged(String systemPrompt) {
    late Conversation conversation =
        state.conversation == null ? Conversation(userId: userId, createdAt: DateTime.now()) : state.conversation!;
    emit(ChatState.unsaved(conversation: conversation.copyWith(systemPrompt: systemPrompt)));
  }

  void onTemperatureChanged(double temperature) {
    late Conversation conversation =
        state.conversation == null ? Conversation(userId: userId, createdAt: DateTime.now()) : state.conversation!;
    emit(ChatState.unsaved(conversation: conversation.copyWith(temperature: temperature)));
  }

  void onConversationNameChanged(String name) {
    late Conversation unsavedConversation = state.conversation == null
        ? Conversation(
            userId: userId,
            createdAt: DateTime.now(),
          )
        : state.conversation!;

    state.maybeWhen(
      orElse: () => emit(ChatState.unsaved(conversation: unsavedConversation.copyWith(name: name))),
      saved: (conversation, _) => emit(ChatState.saved(conversation: conversation.copyWith(name: name))),
    );
  }

  void selectConversation(Conversation conversation) {
    emit(ChatState.saved(conversation: conversation));
  }

  void startNewConversation() {
    emit(const ChatState.unsaved());
  }

  void createEmptyConversation() {
    late Conversation conversation = state.conversation == null
        ? Conversation(id: 0, userId: userId, createdAt: DateTime.now())
        : state.conversation!;
    emit(ChatState.unsaved(conversation: conversation));

    saveConversation();
  }

  void saveConversation() async {
    emit(ChatState.loading(conversation: state.conversation!));

    final response = await _chatRepository.createConversation(conversation: state.conversation!);
    response.when(
      success: (conversation) => emit(ChatState.saved(conversation: conversation, isUpdated: true)),
      error: (error) => emit(ChatState.error(conversation: state.conversation, error: error)),
    );
  }

  void deleteConversation({required Conversation conversation}) async {
    emit(ChatState.loading(conversation: conversation));

    final response = await _chatRepository.deleteConversation(conversationId: conversation.id!);
    response.when(
      success: (conversation) => emit(const ChatState.deleted()),
      error: (error) => emit(ChatState.error(conversation: state.conversation, error: error)),
    );
  }
}

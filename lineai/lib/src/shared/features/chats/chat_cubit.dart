import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/shared/locator.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(ChatState.unsaved(conversation: Conversation(id: 0, userId: '', createdAt: DateTime.now())));

  void onModelChanged(String model) {
    emit(ChatState.unsaved(conversation: state.conversation!.copyWith(model: model)));
  }

  void onSystemPromptChanged(String systemPrompt) {
    emit(ChatState.unsaved(conversation: state.conversation!.copyWith(systemPrompt: systemPrompt)));
  }

  void onTemperatureChanged(double temperature) {
    emit(ChatState.unsaved(conversation: state.conversation!.copyWith(temperature: temperature)));
  }

  void selectConversation(Conversation conversation) {
    emit(ChatState.saved(conversation: conversation));
  }

  void startNewConversation() {
    emit(ChatState.unsaved(conversation: Conversation(id: 0, userId: '', createdAt: DateTime.now())));
  }

  Future<void> saveConversation() async {
    emit(ChatState.loading(conversation: state.conversation!));

    final response = await _chatRepository.createConversation(conversation: state.conversation!);
    response.when(
      success: (conversation) => emit(ChatState.saved(conversation: conversation)),
      error: (error) => emit(ChatState.error(conversation: state.conversation, error: error)),
    );
  }
}

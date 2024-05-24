import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/shared/locator.dart';

part 'send_message_state.dart';
part 'send_message_cubit.freezed.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final ChatRepository _chatRepository;

  SendMessageCubit({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(const SendMessageState.initial());

  Future<void> sendMessage({
    required String content,
    required int conversationId,
  }) async {
    emit(SendMessageState.loading(conversationId: conversationId));

    final response = await _chatRepository.sendMessage(message: content, conversationId: conversationId);

    response.when(
      success: (data) => emit(SendMessageState.success(conversationId: data.conversationId)),
      error: (error) => emit(SendMessageState.error(content: content, conversationId: conversationId, error: error)),
    );
  }
}

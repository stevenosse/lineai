import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/shared/locator.dart';

part 'delete_message_state.dart';
part 'delete_message_cubit.freezed.dart';

class DeleteMessageCubit extends Cubit<DeleteMessageState> {
  final ChatRepository _chatRepository;

  DeleteMessageCubit({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(const DeleteMessageState.initial());

  void deleteMessage(Message message) async {
    emit(DeleteMessageState.loading(message: message));

    final response = await _chatRepository.deleteMessage(message: message);
    response.when(
      success: (_) => emit(DeleteMessageState.success(message: message)),
      error: (error) => emit(DeleteMessageState.error(message: message, error: error)),
    );
  }
}

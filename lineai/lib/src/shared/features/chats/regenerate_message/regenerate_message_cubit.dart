import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/shared/locator.dart';

part 'regenerate_message_state.dart';
part 'regenerate_message_cubit.freezed.dart';

class RegenerateMessageCubit extends Cubit<RegenerateMessageState> {
  final ChatRepository _chatRepository;

  RegenerateMessageCubit({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(const RegenerateMessageState.initial());

  void regenerateMessage({required int messageId}) async {
    emit(RegenerateMessageState.loading(messageId: messageId));

    final response = await _chatRepository.regenerateAnswer(messageId: messageId);
    response.when(
      success: (message) => emit(const RegenerateMessageState.success()),
      error: (error) => emit(RegenerateMessageState.error(error: error)),
    );
  }
}

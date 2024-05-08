import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/features/chat/logic/message_list/message_list_event.dart';
import 'package:lineai/src/shared/locator.dart';

part 'message_list_state.dart';
part 'message_list_cubit.freezed.dart';

class MessageListBloc extends Bloc<MessageListEvent, MessageListState> {
  final ChatRepository _chatRepository;

  StreamSubscription<List<Message>>? _messagesSubscription;

  MessageListBloc({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(const MessageListState.initial()) {
    on<OnReceivedMessages>((event, emit) {
      emit(MessageListState.initial(messages: event.messages));
    });
  }

  void setConversationId(int conversationId) {
    _messagesSubscription?.cancel();
    _messagesSubscription = _chatRepository
        .getMessagesStream(conversationId: conversationId)
        .listen((messages) => add(OnReceivedMessages(messages: messages)));
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}

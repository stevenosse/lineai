import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/features/chat/logic/message_list/message_list_event.dart';
import 'package:lineai/src/shared/locator.dart';

part 'message_list_state.dart';
part 'message_list_bloc.freezed.dart';

class MessageListBloc extends Bloc<MessageListEvent, MessageListState> {
  final ChatRepository _chatRepository;

  StreamSubscription<List<Message>>? _messagesSubscription;

  MessageListBloc({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(const MessageListState.initial()) {
    on<MessageListUpdated>((event, emit) {
      emit(MessageListState.initial(messages: event.messages));
    });

    on<NewConversationStarted>((event, emit) {
      emit(const MessageListState.initial(messages: []));
    });
  }

  void setConversationId(int? conversationId) {
    _messagesSubscription?.cancel();

    if (conversationId == null) {
      add(NewConversationStarted());
      return;
    }

    _messagesSubscription = _chatRepository
        .getMessagesStream(conversationId: conversationId)
        .listen((messages) => add(MessageListUpdated(messages: messages)));
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}

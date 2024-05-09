import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/features/drawer_navigation/logic/conversations/conversation_list_event.dart';
import 'package:lineai/src/shared/locator.dart';

part 'conversation_list_state.dart';
part 'conversation_list_bloc.freezed.dart';

class ConversationListBloc extends Bloc<ConversationListEvent, ConversationListState> {
  final ChatRepository _chatRepository;

  StreamSubscription<List<Conversation>>? _conversationSubscription;

  List<Conversation> _allConversations = [];

  ConversationListBloc({
    ChatRepository? chatRepository,
  })  : _chatRepository = chatRepository ?? locator<ChatRepository>(),
        super(const ConversationListState(conversations: [])) {
    on<OnConversationListUpdated>((event, emit) {
      emit(ConversationListState(conversations: event.conversations));
    });

    on<OnSearchQueryChanged>((event, emit) {
      _onFilterConversations(event.query);
    });

    on<OnSearchExited>((event, emit) {
      emit(ConversationListState(conversations: _allConversations));
    });

    _listenConversations();
  }

  void _listenConversations() {
    _conversationSubscription = _chatRepository.getConversations().listen((conversations) {
      _allConversations = conversations;
      add(OnConversationListUpdated(conversations: conversations));
    });
  }

  void _onFilterConversations(String query) {
    final conversations = _allConversations
        .where((conversation) => conversation.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    add(OnConversationListUpdated(conversations: conversations));
  }

  @override
  Future<void> close() {
    _conversationSubscription?.cancel();
    return super.close();
  }
}

import 'package:equatable/equatable.dart';
import 'package:lineai/src/datasource/models/message.dart';

abstract class MessageListEvent extends Equatable {
  const MessageListEvent();
}

class MessageListUpdated extends MessageListEvent {
  final List<Message> messages;

  const MessageListUpdated({required this.messages});
  
  @override
  List<Object> get props => [];
}

class NewConversationStarted extends MessageListEvent {
  @override
  List<Object> get props => [];
}
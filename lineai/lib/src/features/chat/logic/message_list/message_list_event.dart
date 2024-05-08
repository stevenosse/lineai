import 'package:equatable/equatable.dart';
import 'package:lineai/src/datasource/models/message.dart';

abstract class MessageListEvent extends Equatable {
  const MessageListEvent();
}

class OnReceivedMessages extends MessageListEvent {
  final List<Message> messages;

  const OnReceivedMessages({required this.messages});
  
  @override
  List<Object> get props => [];
}

class OnNewConversationStarted extends MessageListEvent {
  @override
  List<Object> get props => [];
}
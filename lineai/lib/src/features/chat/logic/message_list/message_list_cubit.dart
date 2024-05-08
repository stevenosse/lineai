import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/message.dart';

part 'message_list_state.dart';
part 'message_list_cubit.freezed.dart';

class MessageListCubit extends Cubit<MessageListState> {
  MessageListCubit() : super(const MessageListState.initial());
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_message_response.freezed.dart';

@freezed
class SendMessageResponse with _$SendMessageResponse {
  const factory SendMessageResponse({
    required int conversationId,
  }) = _SendMessageResponse;
}

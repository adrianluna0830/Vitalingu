import 'package:vitalingu/features/chat/model/messages_extra_data.dart';

sealed class ExtraOptionsDisplayState {}

class EmptyOptionsState extends ExtraOptionsDisplayState {}

class UserChatState extends ExtraOptionsDisplayState {}

class UserMessageExtraDataState extends ExtraOptionsDisplayState {
  final UserMessageExtraData extraData;
  final int index;
  UserMessageExtraDataState(this.extraData, this.index);
}

class AIMessageExtraDataState extends ExtraOptionsDisplayState {
  final AIMessageExtraData extraData;
  final int index;
  AIMessageExtraDataState(this.extraData, this.index);
}
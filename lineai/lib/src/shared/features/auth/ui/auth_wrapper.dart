import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/datasource/repositories/chat_repository.dart';
import 'package:lineai/src/features/chat/logic/delete_message/delete_message_cubit.dart';
import 'package:lineai/src/features/settings/logic/user_settings_cubit.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/features/chats/current_chat/chat_cubit.dart';
import 'package:lineai/src/shared/features/chats/regenerate_message/regenerate_message_cubit.dart';

@RoutePage(name: 'AuthRoute')
class AuthWrapper extends StatelessWidget implements AutoRouteWrapper {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteMessageCubit, DeleteMessageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message, result) {
            LoadingDialog.hide(context: context);
            if (result == DeleteMessageResult.conversationDeleted) {
              context.read<ChatCubit>().startNewConversation();
            }
          },
          loading: (message) => LoadingDialog.show(context: context),
          error: (message, error) {
            LoadingDialog.hide(context: context);
            ApiErrorDialog.show(context: context, error: error);
          },
        );
      },
      child: const AutoRouter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ChatCubit()),
        BlocProvider(create: (_) => DeleteMessageCubit()),
        BlocProvider(create: (_) => RegenerateMessageCubit()),
        BlocProvider(
          create: (context) => UserSettingsCubit()..getSettings(),
          lazy: false,
        )
      ],
      child: this,
    );
  }
}

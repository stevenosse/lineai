import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/environment.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/drawer_navigation/logic/conversations/conversation_list_bloc.dart';
import 'package:lineai/src/features/drawer_navigation/logic/conversations/conversation_list_event.dart';
import 'package:lineai/src/features/drawer_navigation/models/drawer_entry.dart';
import 'package:lineai/src/features/drawer_navigation/ui/components/drawer_menu.dart';
import 'package:lineai/src/shared/features/chats/current_chat/chat_cubit.dart';

@RoutePage(name: 'DrawerRoute')
class DrawerWrapper extends StatefulWidget implements AutoRouteWrapper {
  const DrawerWrapper({super.key});

  @override
  State<DrawerWrapper> createState() => _DrawerWrapperState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ConversationListBloc(),
      child: this,
    );
  }
}

class _DrawerWrapperState extends State<DrawerWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final entries = <DrawerEntry>[
    DrawerEntry(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(IconsaxPlusBroken.menu_1),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        centerTitle: true,
        title: Text(
          Environment.appName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(
            icon: const Icon(IconsaxPlusBroken.edit),
            iconSize: Dimens.iconSizeM,
            onPressed: _onNewChatPressed,
          ),
          IconButton(
            icon: const Icon(IconsaxPlusBroken.setting_2),
            iconSize: Dimens.iconSizeM,
            onPressed: _onSettingsPressed,
          )
        ],
      ),
      route: const ChatHomeRoute(),
    ),
  ];

  List<PageRouteInfo> get routes => entries.map((e) => e.route).toList();

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      scaffoldKey: _scaffoldKey,
      drawer: BlocBuilder<ConversationListBloc, ConversationListState>(
        builder: (context, state) {
          return BlocBuilder<ChatCubit, ChatState>(
            builder: (context, chatState) {
              return DrawerMenu(
                conversations: state.conversations,
                selectedConversation: chatState.conversation,
                onSearchQueryChanged: (query) {
                  context.read<ConversationListBloc>().add(ConversationSearchQueryChanged(query: query));
                  if (query.isEmpty) {
                    context.read<ConversationListBloc>().add(ConversationSearchExited());
                  }
                },
                onSearchExited: () => context.read<ConversationListBloc>().add(ConversationSearchExited()),
                onStartConversation: () {
                  context.read<ChatCubit>().startNewConversation();
                  _scaffoldKey.currentState?.closeDrawer();
                },
                onConversationSelected: (conversation) {
                  context.read<ChatCubit>().selectConversation(conversation);
                  _scaffoldKey.currentState?.closeDrawer();
                },
              );
            },
          );
        },
      ),
      appBarBuilder: (context, tabsRouter) => entries[tabsRouter.activeIndex].appBar,
      routes: routes,
    );
  }

  void _onNewChatPressed() => context.read<ChatCubit>().startNewConversation();
  void _onSettingsPressed() => context.router.push(const ChatSettingsRoute());
}

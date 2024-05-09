import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/models/conversation/conversation.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/labeled_divider.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    super.key,
    required this.conversations,
    this.selectedConversation,
    this.onConversationSelected,
    this.onStartConversation,
    this.onSearchQueryChanged,
    this.onSearchExited,
  });

  final Conversation? selectedConversation;
  final List<Conversation> conversations;
  final ValueChanged<String>? onSearchQueryChanged;
  final ValueChanged<Conversation>? onConversationSelected;
  final VoidCallback? onStartConversation;
  final VoidCallback? onSearchExited;

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  double _widthFactor = .8;

  @override
  void initState() {
    _listenInputFocus();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _listenInputFocus() {
    _searchFocusNode.addListener(() {
      setState(() {
        _widthFactor = _searchFocusNode.hasFocus ? 1 : .8;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      width: MediaQuery.of(context).size.width * _widthFactor,
      child: Drawer(
        surfaceTintColor: Colors.transparent,
        shape: const ContinuousRectangleBorder(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimens.spacing),
                child: Input(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  hintText: I18n.of(context).drawer_searchHint,
                  onChanged: widget.onSearchQueryChanged,
                  prefixIcon: ListenableBuilder(
                    listenable: _searchFocusNode,
                    builder: (context, child) {
                      return AnimatedCrossFade(
                        firstChild: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(IconsaxPlusBroken.search_normal, color: context.colorScheme.onSurface),
                        ),
                        secondChild: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: context.colorScheme.onSurface,
                          onPressed: () {
                            _searchFocusNode.unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                            _searchController.clear();
                            widget.onSearchExited?.call();
                          },
                        ),
                        crossFadeState:
                            _searchFocusNode.hasFocus ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: Dimens.spacing),
              ListTile(
                leading: const Icon(IconsaxPlusBroken.message_circle),
                title: Text(I18n.of(context).drawer_newConversation),
                onTap: widget.onStartConversation,
              ),
              const SizedBox(height: Dimens.spacing),
              LabeledDivider(
                label: I18n.of(context).drawer_chatsSectionTitle,
                labelAlignment: Alignment.centerLeft,
                labelBackgroundColor: context.colorScheme.surface,
              ),
              const SizedBox(height: Dimens.halfSpacing),
              Expanded(
                child: widget.conversations.isEmpty
                    ? const _EmptyList()
                    : ListView.builder(
                        itemCount: widget.conversations.length,
                        itemBuilder: (context, index) {
                          final conversation = widget.conversations[index];
                          return ListTile(
                            title: Text(
                              conversation.name.isEmpty ? I18n.of(context).chat_unnamedConversation : conversation.name,
                            ),
                            selected: widget.selectedConversation?.id == conversation.id,
                            selectedTileColor: context.colorScheme.background,
                            onTap: () => widget.onConversationSelected?.call(conversation),
                          );
                        },
                      ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(IconsaxPlusBroken.setting_2),
                title: Text(I18n.of(context).drawer_settings),
                onTap: () => context.router.push(SettingsRoute()),
              ),
              ListTile(
                leading: const Icon(IconsaxPlusBroken.info_circle),
                title: Text(I18n.of(context).drawer_about),
                onTap: () {},
              ),
              const SizedBox(height: Dimens.halfSpacing),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacing),
      child: Text(
        I18n.of(context).drawer_noConversations,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: context.colorScheme.onSurface, fontWeight: FontWeight.w400),
      ),
    );
  }
}

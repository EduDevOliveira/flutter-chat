import 'package:flutter/material.dart';
import 'package:flutter_chat/app/routes/app_routes.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/chat/chat_controller.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/chat/chat_state.dart';
import 'package:flutter_chat/features/chat/presentation/widgets/online_users_widget.dart';
import 'package:flutter_chat/features/splash/presentation/controllers/session_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();

    if (message.isEmpty) return;

    ref.read(chatControllerProvider.notifier).sendMessage(message);

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatControllerProvider);
    final currentUser = ref.watch(sessionControllerProvider).value;

    ref.listenManual(
      chatControllerProvider,
      (previous, next) {
        if (next is Logout) {
          context.goNamed(AppRoutes.login);
        }

        if (next is Error && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.message)),
          );
          ref.invalidate(chatControllerProvider);
        }

        if (next is Loaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_scrollController.hasClients) return;

            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(chatControllerProvider.notifier).logout();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          const OnlineUsersWidget(),
          const Divider(height: 1),

          Expanded(
            child: switch (state) {
              Initial() => const SizedBox(),

              Loading() => const Center(
                child: CircularProgressIndicator(),
              ),

              Error(:final message) => Center(
                child: Text(message),
              ),

              Loaded(:final messages) => ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (_, index) {
                  final message = messages[index];

                  final isMine = message.senderId == currentUser?.id;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Align(
                      alignment: isMine
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.senderName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(message.message),
                          ),
                          Text(
                            DateFormat('HH:mm').format(message.createdAt),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              _ => const SizedBox(),
            },
          ),

          const Divider(height: 1),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: const InputDecoration(
                      hintText: 'Digite uma mensagem...',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

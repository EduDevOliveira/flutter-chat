import 'package:flutter/material.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/online_users/online_users_controller.dart';
import 'package:flutter_chat/features/chat/presentation/controllers/online_users/online_users_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnlineUsersWidget extends ConsumerWidget {
  const OnlineUsersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onlineUsersControllerProvider);

    return switch (state) {
      Initial() => const SizedBox(),

      Loading() => const Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      ),

      Error(:final message) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message),
      ),

      Loaded(:final users) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usuários online (${users.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  final user = users[index];

                  return Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            child: Text(
                              user.name.substring(0, 1).toUpperCase(),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: user.away
                                  ? Colors.amberAccent
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 60,
                        child: Text(
                          user.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      _ => const SizedBox(),
    };
  }
}

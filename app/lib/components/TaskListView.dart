import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../proto/grpc_channel_provider.dart';
import '../service/greeter_service.dart';

final messageProvider = FutureProvider.autoDispose<String>((ref) async {
  final channel = ref.watch(grpcChannelProvider);

  final res = await GrpcGreeterService.sayHello(channel, 'you');

  return res;
});

class TaskListView extends ConsumerWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> message = ref.watch(messageProvider);

    return message.when(
      data: (message) {
        return Text(message);
      },
      error: (err, stack) {
        print(err);
        return Container();
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}

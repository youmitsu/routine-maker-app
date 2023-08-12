import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/index.dart';

// final channelProvider = Provider<ClientChannel>((ref) {
//   final channel = ClientChannel(
//     'localhost',
//     port: 50051,
//     options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//   );
//   ref.onDispose(() {
//     channel.shutdown();
//   });
//   return channel;
// });

// final nameProvider = StateProvider<String>((ref) {
//   return '';
// });

// final greeterProvider = FutureProvider<String>((ref) async {
//   final channel = ref.watch(channelProvider);

//   final name = ref.watch(nameProvider);
//   if (name.isEmpty) {
//     return '';
//   }

//   final client = GreeterClient(channel);

//   final response = await client.sayHello(
//     HelloRequest()..name = name,
//   );
//   print('-------');
//   print(response);

//   return response.message;
// });

void main() {
  runApp(const ProviderScope(child: App()));
}

final mainRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const WelcomePage(),
    routes: <RouteBase>[
      GoRoute(
        path: 'home',
        builder: (context, state) => const HomePage(),
      )
    ],
  ),
]);

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: mainRouter,
      title: 'RoutineMaker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

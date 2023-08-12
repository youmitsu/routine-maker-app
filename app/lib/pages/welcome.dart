import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text('ようこそ', style: TextStyle(fontSize: 30)),
                Text('あなたに合ったルーティンを提案します。', style: TextStyle(fontSize: 20)),
                Text('より良い日々を送りましょう。', style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/home');
              },
              child: const Text('はじめる'),
            ),
          ],
        ),
      ),
    );
  }
}

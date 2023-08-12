import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/TaskEditView.dart';
import '../../components/TaskListView.dart';
import 'state/currentMode.dart';
import 'ui/actionButton.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(currentModeProvider);
    final actionButton = ref.watch(actionButtonProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Routine Maker'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.sunny)),
              Tab(icon: Icon(Icons.mode_night_outlined)),
            ],
          ),
        ),
        body: Container(
          child: currentMode == 'edit'
              ? const TaskEditView()
              : const TaskListView(),
        ),
        floatingActionButton: actionButton,
      ),
    );
  }
}

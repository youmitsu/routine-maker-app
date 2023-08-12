import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/currentMode.dart';

final actionButtonProvider = Provider((ref) {
  final mode = ref.watch(currentModeProvider);

  return mode == 'edit'
      ? FloatingActionButton(
          onPressed: () {
            ref.read(currentModeProvider.notifier).state = 'list';
          },
          child: const Icon(Icons.check),
        )
      : FloatingActionButton(
          onPressed: () {
            ref.read(currentModeProvider.notifier).state = 'edit';
          },
          child: const Icon(Icons.edit),
        );
});

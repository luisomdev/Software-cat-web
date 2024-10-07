import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // Estado inicial

  void updateIndex(int index) {
    state = index;
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class LayoutNavigationBottom extends ConsumerWidget {
  const LayoutNavigationBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return NavigationBar(
      onDestinationSelected: (int index) {
        ref.read(counterProvider.notifier).updateIndex(index);
      },
      selectedIndex: count,
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_max),
          label: 'Home',
        ),
        NavigationDestination(
            selectedIcon: Icon(Icons.image),
            icon: Icon(Icons.view_carousel_sharp),
            label: 'View'),
        NavigationDestination(
          selectedIcon: Icon(Icons.cloud_upload),
          icon: Icon(Icons.file_upload),
          label: 'Upload',
        ),
      ],
    );
  }
}

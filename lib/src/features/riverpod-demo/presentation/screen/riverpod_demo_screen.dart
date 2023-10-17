import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

var counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

class RiverpodDemoScreen extends ConsumerStatefulWidget {
  const RiverpodDemoScreen({super.key});

  @override
  ConsumerState<RiverpodDemoScreen> createState() => _RiverpodDemoScreenState();
}

class _RiverpodDemoScreenState extends ConsumerState<RiverpodDemoScreen> {
//   int _counter = 0;

  // void _incrementCounter() {
  //   ref.watch(counterProvider.notifier).state++;
  // }

  @override
  Widget build(BuildContext context) {
    int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Counter app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.watch(counterProvider.notifier).decrement(),
        tooltip: 'Decrement',
        child: const Icon(Icons.add),
      ),
    );
  }
}

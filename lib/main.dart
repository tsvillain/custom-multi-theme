import 'package:custom_multi_theme/theme_notifier.dart';
import 'package:custom_multi_theme/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the value of StateNotifier and updates theme in MaterialApp
    ThemeData theme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Multi Theme Demo',
      theme: theme,
      home: const MyHomePage(title: 'Flutter Multi Theme Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ThemeScreen())),
            icon: const Icon(Icons.design_services_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context)
            .primaryColor, // Using color is simple just use the Theme.of(context)
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add, color: Theme.of(context).secondaryHeaderColor),
      ),
    );
  }
}

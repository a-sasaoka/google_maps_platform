import 'package:flutter/material.dart';
import 'package:google_maps_platform/map_view.dart';

void main() {
  runApp(const MyApp());
}

/// アプリのベースになる Widget
class MyApp extends StatelessWidget {
  /// コンストラクタ
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Platform Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Google Maps Platform Demo Home Page'),
    );
  }
}

/// ホーム画面
class MyHomePage extends StatefulWidget {
  /// コンストラクタ
  const MyHomePage({required this.title, super.key});

  /// 画面タイトル
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const MapView(),
                  ),
                );
              },
              child: const Text(
                '地図表示',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

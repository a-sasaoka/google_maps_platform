import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_platform/map_view.dart';
import 'package:google_maps_platform/place_view.dart';

Future<void> main() async {
  await dotenv.load();
  log(dotenv.get('apiKey'));

  runApp(const ProviderScope(child: MyApp()));
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
          child: Column(
            children: [
              const Gap(16),
              Center(
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
                    '現在位置の地図表示',
                  ),
                ),
              ),
              const Gap(16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const PlaceView(),
                      ),
                    );
                  },
                  child: const Text(
                    '場所検索',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

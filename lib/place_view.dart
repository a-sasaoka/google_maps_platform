import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_platform/place_model.dart';
import 'package:http/http.dart' as http;

/// 場所検索画面
class PlaceView extends StatefulWidget {
  /// コンストラクタ
  const PlaceView({super.key});

  @override
  State<PlaceView> createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  var _value = '';
  var _description = <Description>[];

  Future<void> _search() async {
    final querys = <String, Object>{
      'input': _value,
      'key': dotenv.get('apiKey'),
    };
    final url = Uri.https(
      'maps.googleapis.com',
      'maps/api/place/autocomplete/json',
      querys,
    );
    final response = await http.get(url);
    log('ステータスコード : ${response.statusCode}');
    log(response.body);
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final prediction = Prediction.fromJson(data);
    if (prediction.predictions != null) {
      setState(() {
        _description = prediction.predictions!;
      });
    }
    log(prediction.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('場所検索'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 32),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: '検索したい場所など',
                  ),
                  onChanged: (value) {
                    _value = value;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _search,
                child: const Text(
                  '検索',
                ),
              ),
              const Gap(32),
              if (_description.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _description.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 32,
                          right: 32,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            _description[index].structuredFormatting!.mainText!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_platform/map_view.dart';
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
  final FocusNode _focusNode = FocusNode();

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
    if (prediction.description != null) {
      setState(() {
        _description = prediction.description!;
      });
    }
    log(prediction.toString());
  }

  Future<LatLon> _getLatLon(Description description) async {
    final querys = <String, Object>{
      'place_id': description.placeId!,
      'key': dotenv.get('apiKey'),
    };
    final url = Uri.https(
      'maps.googleapis.com',
      'maps/api/place/details/json',
      querys,
    );
    final response = await http.get(url);
    log('ステータスコード : ${response.statusCode}');
    log(response.body);
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final result = Result.fromJson(data);
    log(result.toString());

    return result.geometry!.location!.latLon!;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    labelText: '検索したい場所など',
                  ),
                  onChanged: (value) {
                    _value = value;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // キーボードを閉じる
                  FocusScope.of(context).unfocus();
                  _search();
                },
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
                          onPressed: () async {
                            // 遷移前にキーボードを閉じる
                            FocusScope.of(context).unfocus();

                            final latLon =
                                await _getLatLon(_description[index]);
                            final latLng = LatLng(latLon.lat!, latLon.lng!);
                            if (context.mounted) {
                              await Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (context) => MapView(
                                    target: latLng,
                                    targetName: _description[index]
                                        .structuredFormatting!
                                        .mainText,
                                  ),
                                ),
                              );

                              // 地図表示から戻った時にテキストボックスからフォーカスを外す
                              _focusNode.unfocus();
                            }
                          },
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

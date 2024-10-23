import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// 地図表示画面
class MapView extends StatefulWidget {
  /// コンストラクタ
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late Future<LatLng?> _initData;

  var _isLoading = false;

  /// 位置情報を取得する
  Future<LatLng> _getCurrentLocation() async {
    /// わざと3秒待つ（動作をわかりやすくするため）
    await Future.delayed(const Duration(seconds: 3), () {});

    final position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  /// 位置情報の権限を取得する（権限が無い場合は権限を求める）
  Future<LocationSettingResult> _checkLocationSetting() async {
    /// 位置情報サービスが有効かどうか
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    /// 有効で無い場合は諦める
    if (!serviceEnabled) {
      log('Location services are disabled.');
      return Future.value(LocationSettingResult.serviceDisabled);
    }

    /// 権限を取得
    var permission = await Geolocator.checkPermission();

    /// 権限が無い場合は権限をリクエスト
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      /// リクエストしても拒否された場合は諦める
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied.');
        return Future.value(LocationSettingResult.permissionDenied);
      }
    }

    /// 永続的に権限を拒否されている場合も諦める
    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied.');
      return Future.value(LocationSettingResult.permissionDeniedForever);
    }

    /// 権限が付与された場合
    return Future.value(LocationSettingResult.enabled);
  }

  // 初期化処理
  Future<LatLng?> _init() async {
    final result = await _checkLocationSetting();

    if (result != LocationSettingResult.enabled) {
      return null;
    }

    return _getCurrentLocation();
  }

  /// 地図の拡大・縮小
  Future<void> _zoom(Zoom zoom) async {
    setState(() {
      _isLoading = true;
    });

    final controller = await _controller.future;

    switch (zoom) {
      case Zoom.zoomIn:
        await controller.moveCamera(CameraUpdate.zoomIn());

      case Zoom.zoomOut:
        await controller.moveCamera(CameraUpdate.zoomOut());
    }

    setState(() {
      _isLoading = false;
    });
  }

  /// 現在位置に戻る
  Future<void> _initPosition() async {
    setState(() {
      _isLoading = true;
    });

    final center = await _getCurrentLocation();
    final controller = await _controller.future;
    final zoom = await controller.getZoomLevel();
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: center,
          zoom: zoom,
        ),
      ),
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _initData = _init();
  }

  @override
  Widget build(BuildContext context) {
    late LatLng center;

    return FutureBuilder<LatLng?>(
      future: _initData,
      builder: (BuildContext context, AsyncSnapshot<LatLng?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data == null) {
            return const Center(
              child: Text('位置情報が取得できませんでした。'),
            );
          }
          center = snapshot.data!;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('地図表示'),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 480,
                      child: GoogleMap(
                        myLocationButtonEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: center,
                          zoom: 15,
                        ),
                        onMapCreated: _controller.complete,
                        markers: {
                          Marker(
                            markerId: const MarkerId('marker_1'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueBlue,
                            ),
                            position: center,
                            infoWindow: const InfoWindow(
                              title: '現在位置（title）',
                              snippet: '現在位置（snippet）',
                            ),
                          ),
                        },
                      ),
                    ),
                    const Gap(16),
                    SizedBox(
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await _zoom(Zoom.zoomIn);
                            },
                            child: const Text(
                              '拡大',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await _zoom(Zoom.zoomOut);
                            },
                            child: const Text(
                              '縮小',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await _initPosition();
                            },
                            child: const Text(
                              '現在位置へ',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_isLoading)
                  ColoredBox(
                    color: Colors.black.withOpacity(0.5), // 背景を半透明にして重ねる
                    child: const Center(
                      child: CircularProgressIndicator(), // スピナーを中央に表示
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 位置情報権限取得結果
enum LocationSettingResult {
  /// 無効
  serviceDisabled,

  /// 不許可
  permissionDenied,

  /// 不許可（永続的に）
  permissionDeniedForever,

  /// 許可
  enabled,
}

/// 拡大縮小指定
enum Zoom {
  /// 拡大
  zoomIn,

  /// 縮小
  zoomOut,
}

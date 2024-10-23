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

  /// 位置情報を取得する
  Future<LatLng> _getCurrentLocation() async {
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

  Future<LatLng> _init(BuildContext context) async {
    await _checkLocationSetting();

    return _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    late LatLng center;

    return FutureBuilder<LatLng>(
      future: _init(context),
      builder: (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
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
            child: Column(
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
                          final controller = await _controller.future;
                          await controller.moveCamera(CameraUpdate.zoomIn());
                        },
                        child: const Text(
                          '拡大',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final controller = await _controller.future;
                          await controller.moveCamera(CameraUpdate.zoomOut());
                        },
                        child: const Text(
                          '縮小',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          center = await _getCurrentLocation();
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

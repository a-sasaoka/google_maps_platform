import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// 地図表示画面
class MapView extends StatefulWidget {
  /// コンストラクタ
  const MapView({super.key, this.target, this.targetName});

  /// 目的地の緯度経度
  final LatLng? target;

  /// 目的地名
  final String? targetName;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late Future<LatLng?> _initData;

  var _isLoading = false;

  LatLngBounds? _bounds;

  final Set<Polyline> _polyline = {};

  /// 位置情報を取得する
  Future<LatLng> _getCurrentLocation() async {
    /// わざと少し待つ（動作をわかりやすくするため）
    await Future.delayed(const Duration(seconds: 1), () {});

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

  /// 指定された地点に戻る
  Future<void> _initPosition(ResetPos resetPos) async {
    setState(() {
      _isLoading = true;
    });

    late final LatLng pos;
    if (resetPos == ResetPos.currentPos) {
      pos = await _getCurrentLocation();
    } else {
      pos = widget.target!;
    }
    final controller = await _controller.future;
    final zoom = await controller.getZoomLevel();
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: pos,
          zoom: zoom,
        ),
      ),
    );

    setState(() {
      _isLoading = false;
    });
  }

  /// 現在位置と目的地が収まる縮尺を設定
  Future<void> _moveCameraToBounds() async {
    final controller = await _controller.future;

    if (_bounds != null) {
      // 指定した範囲にカメラを移動（余白を指定）
      await controller
          .animateCamera(CameraUpdate.newLatLngBounds(_bounds!, 100));
    }
  }

  // ルート表示データ取得
  Future<void> _getRoutes() async {
    setState(() {
      _isLoading = true;
    });

    final points = await _createPolyline();
    setState(() {
      _polyline.add(
        Polyline(
          polylineId: const PolylineId('Route'),
          // color: Colors.blue,
          // width: 5,
          points: points,
        ),
      );
    });

    setState(() {
      _isLoading = false;
    });
  }

  // ルート表示
  Future<List<LatLng>> _createPolyline() async {
    final pos = await _getCurrentLocation();

    final polylineCoordinates = <LatLng>[];
    final polylinePoints = PolylinePoints();
    final polylineRequest = PolylineRequest(
      origin: PointLatLng(pos.latitude, pos.longitude),
      destination:
          PointLatLng(widget.target!.latitude, widget.target!.longitude),
      mode: TravelMode.driving,
    );
    final result = await polylinePoints.getRouteBetweenCoordinates(
      request: polylineRequest,
      googleApiKey: dotenv.get('apiKey'),
    );

    if (result.points.isNotEmpty) {
      for (final point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    return polylineCoordinates;
  }

  @override
  void initState() {
    super.initState();

    _initData = _init();
  }

  @override
  Widget build(BuildContext context) {
    late LatLng center;
    late LatLng currentPos;

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

          currentPos = snapshot.data!;

          if (widget.target == null) {
            center = snapshot.data!;
          } else {
            center = widget.target!;
            final point1 = center;
            final point2 = currentPos;

            if (point1.latitude >= point2.latitude) {
              _bounds = LatLngBounds(
                southwest: point2,
                northeast: point1,
              );
            } else {
              _bounds = LatLngBounds(
                southwest: point1,
                northeast: point2,
              );
            }
          }
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
                        onMapCreated: (controller) {
                          _controller.complete(controller);
                          _moveCameraToBounds();
                        },
                        polylines: _polyline,
                        markers: {
                          Marker(
                            markerId: const MarkerId('marker_1'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueBlue,
                            ),
                            position: currentPos,
                            infoWindow: const InfoWindow(
                              title: '現在位置（title）',
                              snippet: '現在位置（snippet）',
                            ),
                          ),
                          if (widget.targetName != null &&
                              widget.target != null)
                            Marker(
                              markerId: const MarkerId('marker_2'),
                              position: center,
                              infoWindow: InfoWindow(
                                title: widget.targetName,
                              ),
                            ),
                        },
                      ),
                    ),
                    const Gap(16),
                    Column(
                      children: [
                        Row(
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
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await _initPosition(ResetPos.currentPos);
                              },
                              child: const Text(
                                '現在位置へ',
                              ),
                            ),
                            if (widget.target != null)
                              ElevatedButton(
                                onPressed: () async {
                                  await _initPosition(ResetPos.targetPos);
                                },
                                child: const Text(
                                  '目的地へ',
                                ),
                              ),
                            if (widget.target != null)
                              ElevatedButton(
                                onPressed: () async {
                                  await _getRoutes();
                                },
                                child: const Text(
                                  'ルート検索',
                                ),
                              ),
                          ],
                        ),
                      ],
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

/// 地図のリセット先
enum ResetPos {
  /// 現在位置
  currentPos,

  /// 目的地
  targetPos,
}

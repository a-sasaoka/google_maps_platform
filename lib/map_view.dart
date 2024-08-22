import 'dart:async';

import 'package:flutter/material.dart';
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

  final _center = const LatLng(35.6895, 139.6917);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('地図表示'),
      ),
      body: SafeArea(
        child: GoogleMap(
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15,
          ),
          onMapCreated: _controller.complete,
        ),
      ),
    );
  }
}

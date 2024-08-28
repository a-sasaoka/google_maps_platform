import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: 480,
              child: GoogleMap(
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 15,
                ),
                onMapCreated: _controller.complete,
                markers: {
                  Marker(
                    markerId: const MarkerId('marker_1'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
                    position: _center,
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
                      final controller = await _controller.future;
                      final zoom = await controller.getZoomLevel();
                      await controller.moveCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: _center,
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
  }
}

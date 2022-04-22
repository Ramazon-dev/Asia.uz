import 'dart:async';

import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/shops_model.dart';
import 'package:asia_uz/service/api/shops_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopsPage extends StatelessWidget {
  ShopsPage({Key? key}) : super(key: key);

  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );

  final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ShopsModel>(
          future: getShops(),
          builder: (context, AsyncSnapshot<ShopsModel> snap) {
            if (snap.hasError) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 40),
              );
            } else if (snap.hasData) {
              debugPrint("api dan keladigan malumot ${snap.data!.address}");
              return GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 10),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

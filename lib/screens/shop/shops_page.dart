import 'dart:async';
import 'package:asia_uz/core/constants/loader.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/model/get/shop_api_model.dart';
import 'package:asia_uz/core/widgets/notification/notification_page.dart';
import 'package:asia_uz/cubit/shop_cubit/shop_cubit.dart';
import 'package:asia_uz/cubit/shop_cubit/shop_cubit_state.dart';
import 'package:asia_uz/service/api/get/shop_api_services.dart';
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
    return BlocProvider(
      create: (context) => ShopCubit(
        SampleShopRepository(),
      ),
      child: Scaffold(
        body: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {
            if (state is ShopError) {
              const Notifications()
                  .flash(context, state.errorMessage, Colors.red);
            }
          },
          builder: (context, state) {
            if (state is ShopInitial) {
              return Loader.loader();
            } else if (state is ShopLoading) {
              return Loader.loader();
            } else if (state is ShopCompledet) {
              debugPrint('state : ${state.response[0].city}');
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );
            } else {
              final error = state as ShopError;
              return Center(
                child: Text(error.errorMessage),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To the lake!'),
          icon: const Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

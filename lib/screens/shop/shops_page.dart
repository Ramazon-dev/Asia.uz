import 'dart:async';
import 'package:asia_uz/core/constants/loader.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/widgets/notification/notification_page.dart';
import 'package:asia_uz/cubit/shop_cubit/shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopsPage extends StatefulWidget {
  ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(41.3494548, 69.2171245),
    zoom: 10.4746,
  );

  final CameraPosition _kLake = const CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(41.3494548, 69.2171245),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
  List<LatLng> listOfLatLng = [
    const LatLng(41.3494548, 69.217223),
    const LatLng(41.34, 69.21456),
    const LatLng(41.0, 69.00),
    const LatLng(41.30, 69.271245),
    const LatLng(41.31, 69.2),
  ];
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  TextEditingController controller = TextEditingController();

  OnPressProvider? onPressProvider;
  @override
  Widget build(BuildContext context) {
    List list = List.generate(5, (index) => _add(index));
    onPressProvider = Provider.of<OnPressProvider>(context);
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
                markers: Set<Marker>.of(markers.values),
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
      ),
    );
  }

  void _add(int index) async {
    late BitmapDescriptor pinLocationIcon;
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 5, size: Size(40, 100)),
        "assets/icons/location.png");
    MarkerId markerId = MarkerId("id $index");
    final Marker marker = Marker(
      markerId: markerId,
      position: listOfLatLng[index],
      icon: pinLocationIcon,
      infoWindow: InfoWindow(title: "Asia Uz", snippet: "$index fillial"),
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
          height: getHeight(370),
          width: getWidth(375),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getHeight(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hoverColor: AppColors.textFormField,
                    focusColor: AppColors.textFormField,
                    label: const Icon(
                      Icons.search,
                      color: AppColors.textFormField,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.textFormField,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.textFormField,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.textFormField,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ListTile(
                  leading: MyTextWidget(text: "Магазин", fontSize: getHeight(18)),
                  trailing: Icon(Icons.arrow_forward_ios, size: getHeight(15)),
                  onTap: () {},
                ),
                ListTile(
                  leading: MyTextWidget(text: "Город", fontSize: getHeight(18)),
                  trailing: Icon(Icons.arrow_forward_ios, size: getHeight(15)),
                  onTap: () {},
                ),
                MyElevatedButton(
                  text: "Сохранить",
                  sideColor: AppColors.orange,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    setState(() => markers[markerId] = marker);
    // onPressProvider!.onPress();
    // markers[markerId] = marker;
  }
}

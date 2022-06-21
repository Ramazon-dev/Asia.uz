import 'dart:async';
import 'package:asia_uz/core/constants/loader.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/core/widgets/notification/notification_page.dart';
import 'package:asia_uz/cubit/shop_cubit/shop_cubit.dart';
import 'package:asia_uz/screens/shop/widgets/showmodalbottomsheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  // List<LatLng> listOfLatLng = [
  //   const LatLng(41.3494548, 69.217223),
  //   const LatLng(41.34, 69.21456),
  //   const LatLng(41.0, 69.00),
  //   const LatLng(41.30, 69.271245),
  //   const LatLng(41.31, 69.2),
  // ];
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  TextEditingController controller = TextEditingController();

  OnPressProvider? onPressProvider;
  @override
  Widget build(BuildContext context) {
    onPressProvider = Provider.of<OnPressProvider>(context);
    return BlocProvider(
      create: (context) => ShopCubit(
        SampleShopRepository(),
      ),
      child: Scaffold(
        body: SlidingUpPanel(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getHeight(15)),
            topRight: Radius.circular(getHeight(15)),
          ),
          maxHeight: getHeight(320),
          minHeight: getHeight(100),
          panel: const ShowModalBottomSheetWidget(),
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
                List list = List.generate(
                  state.response.length,
                  (index) => _add(
                    index: index,
                    latitude: state.response[index].latitude,
                    longitude: state.response[index].longitude,
                    adreess: state.response[index].address,
                  ),
                );

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
      ),
    );
  }

  void _add({
    required int index,
    String? latitude,
    String? longitude,
    String? adreess,
  }) async {
    late BitmapDescriptor pinLocationIcon;
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 5, size: Size(40, 100)),
        "assets/icons/location.png");
    MarkerId markerId = MarkerId("id $index");
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(double.parse(latitude!), double.parse(longitude!)),
      icon: pinLocationIcon,
      infoWindow: InfoWindow(title: "Asia Uz", snippet: "$index fillial"),
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
          height: getHeight(400),
          width: getWidth(375),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getHeight(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: getHeight(5),
                  width: getWidth(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getHeight(5)),
                    color: AppColors.textTite,
                  ),
                ).only(bottom: getHeight(15)),
                MyTextWidget(
                  text: "Asia.uz - Bodomzor",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  textColor: AppColors.black,
                ),
                Row(
                  children: [
                    MyTextWidget(
                      text: "Закрыт.",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      textColor: AppColors.textRed,
                    ).only(right: getWidth(15)),
                    MyTextWidget(
                      text: "Откроется в 8:00",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      textColor: AppColors.textTite,
                    ),
                  ],
                ).symmetric(
                  vertical: getHeight(13),
                ),
                const Divider(thickness: 2),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: AppColors.textTite,
                      size: getHeight(20),
                    ).only(right: getWidth(20)),
                    MyTextWidget(
                      text: "+998 99 999 99 99",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      textColor: AppColors.black,
                    ),
                  ],
                ).symmetric(
                  vertical: getHeight(13),
                ),
                const Divider(thickness: 2),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppColors.textTite,
                      size: getHeight(20),
                    ).only(right: getWidth(15)),
                    MyTextWidget(
                      text: "Ежедневно с 08:00 до 22:00",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      textColor: AppColors.black,
                    ),
                  ],
                ).symmetric(
                  vertical: getHeight(13),
                ),
                const Divider(thickness: 2),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.textTite,
                      size: getHeight(20),
                    ).only(right: getWidth(15)),
                    MyTextWidget(
                      text: adreess!,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      textColor: AppColors.black,
                      // textAlign: TextAlign.center,
                    ),
                  ],
                ).symmetric(vertical: getHeight(13)),
                MyElevatedButton(
                  text: "Сохранить",
                  sideColor: AppColors.orange,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ).only(top: getHeight(20)),
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

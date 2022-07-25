import 'package:asia_uz/core/model/get/shop_api_model.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  GoogleMapController? mapController;

  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(41.3494548, 69.2171245),
    zoom: 12,
  );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  TextEditingController controller = TextEditingController();
  String editableString = "";
  OnPressProvider? onPressProvider;
  @override
  Widget build(BuildContext context) {
    // onPressProvider = Provider.of<OnPressProvider>(context);
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
              List list = List.generate(
                state.response.length,
                (index) => _add(
                  index: index,
                  latitude: state.response[index].longitude ?? "",
                  longitude: state.response[index].latitude ?? "",
                  adreess: state.response[index].address ?? "",
                  contact: state.response[index].contact ?? "",
                  name: state.response[index].name ?? "",
                  workingHours: state.response[index].workingHours ?? "",
                ),
              );

              debugPrint('''
state : ${state.response[0].address}
${state.response[0].city}
${state.response[0].contact}
${state.response[0].id}
${state.response[0].latitude}
${state.response[0].longitude}
${state.response[0].name}
${state.response[0].shopId}
${state.response[0].v}
${state.response[0].workingHours}
                ''');
              return SlidingUpPanel(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getHeight(15)),
                  topRight: Radius.circular(getHeight(15)),
                ),
                maxHeight: getHeight(320),
                minHeight: getHeight(100),
                panel: showModalBottomSheetMethod(state.response),
                body: GoogleMap(
                  markers: Set<Marker>.of(markers.values),
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
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

  SizedBox showModalBottomSheetMethod(List<ShopsModel> state) {
    return SizedBox(
      height: getHeight(320),
      width: getWidth(375),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/icons/arrow_down.png",
              height: getHeight(15),
            ),
            SizedBox(height: getHeight(15)),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(left: getWidth(10)),
                height: getHeight(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.textFormField,
                    width: 2,
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.search,
                  color: AppColors.textFormField,
                ),
              ),
              onTap: () {
                // shopsModalBottomSheet();
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: MyTextWidget(text: "Магазин", fontSize: getHeight(18)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: getHeight(20),
                color: AppColors.black,
              ),
              onTap: () {
                shopsModalBottomSheet(state);
                debugPrint("magazin bosildi");
              },
            ),
            const Divider(thickness: 1.5),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: MyTextWidget(text: "Город", fontSize: getHeight(18)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: getHeight(20),
                color: AppColors.black,
              ),
              onTap: () {
                gorodBottomSHeet();
                debugPrint("gorod bosildi");

                mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      target: LatLng(41.574368, 64.183319),
                      zoom: 15,
                    ),
                  ),
                );
              },
            ),
            const Divider(thickness: 1.5),
            SizedBox(
              height: getHeight(12),
            ),
            MyElevatedButton(
              text: "Сохранить",
              sideColor: AppColors.orangeColor,
              onPressed: () {
                debugPrint("soxranit bosildi");
                mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      target: LatLng(41.311081, 69.240562),
                      zoom: 10,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  gorodBottomSHeet() {
    return showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: getHeight(700),
        // color: Colors.yellow,
        child: Column(
          children: [
            Image.asset(
              "assets/icons/arrow_down.png",
              height: getHeight(15),
            ),
            Text(
              "Города",
              style: TextStyle(
                color: Colors.black,
                fontSize: getHeight(20),
                fontWeight: FontWeight.w500,
              ),
            ).only(
              bottom: getHeight(15),
              top: getHeight(15),
            ),
            SizedBox(
              height: getHeight(500),
              // color: Colors.cyan,
              child: ListView.builder(
                itemCount: listOfStrings.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: MyTextWidget(
                            text: listOfStrings[index],
                            fontSize: getHeight(18)),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: AppColors.black, size: getHeight(20)),
                        onTap: () {
                          switch (index) {
                            case 0:
                              debugPrint("Toshkent bosildi $index");
                              cameraPositionMethod(
                                lat: 41.311081,
                                long: 69.240562,
                              );
                              Navigator.pop(context);
                              break;
                            case 1:
                              debugPrint("navoiy bosildi $index");
                              cameraPositionMethod(
                                lat: 40.08444,
                                long: 65.37917,
                              );
                              Navigator.pop(context);
                              break;
                            case 2:
                              debugPrint("andijon bosildi $index");
                              cameraPositionMethod(
                                lat: 40.7833302,
                                long: 72.333332,
                              );
                              Navigator.pop(context);
                              break;
                            case 3:
                              debugPrint("namangan bosildi $index");
                              cameraPositionMethod(
                                lat: 40.9983,
                                long: 71.67257,
                              );
                              Navigator.pop(context);
                              break;
                            case 4:
                              debugPrint("nukus bosildi $index");
                              cameraPositionMethod(
                                lat: 42.45306,
                                long: 59.61028,
                              );
                              Navigator.pop(context);
                              break;
                            case 5:
                              debugPrint("fergana bosildi $index");
                              cameraPositionMethod(
                                lat: 40.38421,
                                long: 71.78432,
                              );
                              Navigator.pop(context);
                              break;
                            case 6:
                              debugPrint("buxara bosildi $index");
                              cameraPositionMethod(
                                lat: 39.77472,
                                long: 64.42861,
                              );
                              Navigator.pop(context);
                              break;
                            case 7:
                              debugPrint("samarqand bosildi $index");
                              cameraPositionMethod(
                                lat: 39.652451,
                                long: 66.970139,
                              );
                              Navigator.pop(context);
                              break;
                            case 8:
                              debugPrint("Toshkent viloyati bosildi $index");
                              cameraPositionMethod(
                                lat: 40.70453,
                                long: 69.07263,
                              );
                              Navigator.pop(context);
                              break;
                            default:
                          }
                        },
                      ),
                      const Divider(thickness: 1.5),
                    ],
                  );
                },
              ),
            ),
            MyElevatedButton(
              text: "Сохранить",
              sideColor: AppColors.orangeColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ).only(top: getHeight(15)),
          ],
        ),
      ),
    );
  }

  cameraPositionMethod(
      {required double lat, required double long, double zoom = 10}) {
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: zoom,
        ),
      ),
    );
  }

  shopsModalBottomSheet(List<ShopsModel> state) {
    return showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: getHeight(750),
        // color: Colors.yellow,
        child: Column(
          children: [
            Image.asset(
              "assets/icons/arrow_down.png",
              height: getHeight(15),
            ),
            Text(
              "Магазины",
              style: TextStyle(
                color: Colors.black,
                fontSize: getHeight(20),
                fontWeight: FontWeight.w500,
              ),
            ).only(
              bottom: getHeight(15),
              top: getHeight(15),
            ),
            TextFormField(
              // controller: controller,
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
            SizedBox(
              height: getHeight(500),
              // color: Colors.cyan,
              child: ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: MyTextWidget(
                            text: state[index].name ?? state[index].city!,
                            fontSize: getHeight(18)),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.black,
                          size: getHeight(20),
                        ),
                        onTap: () {
                          cameraPositionMethod(
                            lat: double.parse(state[index].longitude ?? ""),
                            long: double.parse(state[index].latitude ?? ""),
                            zoom: 15,
                          );
                          Navigator.pop(context);
                          shopInfoMethod(
                            state[index].name ?? "",
                            state[index].workingHours,
                            state[index].contact ?? "",
                            state[index].address ?? "",
                          );
                        },
                      ),
                      const Divider(thickness: 1.5),
                    ],
                  );
                },
              ),
            ),
            MyElevatedButton(
              text: "Сохранить",
              sideColor: AppColors.orangeColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ).only(top: getHeight(15)),
          ],
        ),
      ),
    );
  }

  void _add({
    required int index,
    required String latitude,
    required String longitude,
    required String adreess,
    required String name,
    required String contact,
    required String? workingHours,
  }) async {
    late BitmapDescriptor pinLocationIcon;
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 5, size: Size(40, 100)),
      "assets/icons/location.png",
    );
    MarkerId markerId = MarkerId("id $index");
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(double.parse(latitude), double.parse(longitude)),
      icon: pinLocationIcon,
      infoWindow: InfoWindow(title: "Asia Uz", snippet: name),
      onTap: () => shopInfoMethod(name, workingHours, contact, adreess),
    );
    setState(() => markers[markerId] = marker);
    // onPressProvider!.onPress();
    // markers[markerId] = marker;
  }

  Future<dynamic> shopInfoMethod(
      String name, String? workingHours, String contact, String adreess) {
    return showModalBottomSheet(
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      height: getHeight(5),
                      width: getWidth(45),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getHeight(5)),
                        color: AppColors.textTite,
                      ),
                    ).only(bottom: getHeight(15)),
                    Image.asset(
                      "assets/icons/close.png",
                    ),
                  ],
                ),
              ),
              MyTextWidget(
                text: "Asia.uz $name",
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
                    textColor: AppColors.orangeColor,
                  ).only(right: getWidth(15)),
                  MyTextWidget(
                    text: "Откроется в ${workingHours ?? "8:00"}",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    textColor: AppColors.bottomUnselectedColor,
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
                    text: contact,
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
                    text: adreess,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    textColor: AppColors.black,
                    // textAlign: TextAlign.center,
                  ),
                ],
              ).symmetric(vertical: getHeight(13)),
              MyElevatedButton(
                text: "Проложить маршрут".tr(),
                sideColor: AppColors.orangeColor,
                textColor: AppColors.shopsColor,
                textSize: 18,
                fontWeight: FontWeight.w500,
                onPressed: () {
                  Navigator.pop(context);
                },
              ).only(top: getHeight(20)),
            ],
          ),
        ),
      ),
    );
  }

  List<String> listOfStrings = [
    "Tashkent",
    "Навои",
    "Андижан",
    "Наманган",
    "Нукус",
    "Фергана",
    "Бухара",
    "Самарканд",
    "Ташкент",
  ];
  List<String> shaxarlar = [
    "tashkent",
    "navoi",
    "andijan",
    "namangan",
    "nukus",
    "fergana",
    "buxara",
    "samarkand",
    "tashkentVil",
  ];
}

import 'package:asia_uz/service/api/post/loyality_phythical.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBarWidget(
        iconColor: AppColors.whiteColor,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          Positioned(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return constraints.maxWidth < 600
                    ? tabbuildResult()
                    : buildResult();
              },
            ),
            bottom: getHeight(40),
          ),
          // barcode!.code != null ?Positioned(
          //   child: Container(
          //     height: 250,
          //     width: 350,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(getHeight(20)),
          //       color: Colors.white,
          //     ),

          //   ),
          // ): Container(
          //   height: 15,
          //   width: 150,
          //   color: Colors.yellow,
          // ),
        ],
      ),
    );
  }

  QRView buildQRView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.white,
        ),
      );

  Widget buildResult() => Container(
        alignment: Alignment.center,
        height: getHeight(167),
        width: getWidth(311),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              barcode != null
                  ? "Result:" "${barcode!.code}"
                  : "Scan a code!".tr(),
              style: TextStyle(
                fontSize: getHeight(16),
                fontWeight: FontWeight.w400,
              ),
            ),
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Закрыть".tr(),
              textColor: AppColors.whiteColor,
              onPressed: () async {
                if (barcode!.code != null) {
                  String message =
                      await LoyalityPhythicalService.loyalityPhythicalService(
                    barcode!.code!,
                  );
                  debugPrint("statusCode: $message");
                  if (message == "Success") {
                    showSuccseccDialog();
                  } else {
                    String error =
                        "Unexpected error: BadRequestException: У пользователя уже существует физическая карта.";
                    if (message == error) {
                      showErrorDialog(
                        "У пользователя уже существует физическая карта.",
                      );
                    } else {
                      showErrorDialog(message);
                    }
                  }
                  debugPrint("endi ikinchisini ichiga kirdi: $message");
                  // showModalBottomSheet(
                  //   context: context,
                  //   backgroundColor: Colors.cyan,
                  //   builder: (context) => Container(),
                  // );
                  //     const Duration(seconds: 2);
                  //     debugPrint("Duration dan otdi ${barcode!.code}");
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) {
                  //         return AlertDialog(
                  //           actionsPadding: const EdgeInsets.all(8),
                  //           alignment: Alignment.center,
                  //           elevation: 2,
                  //           title: Text(
                  //             "Ваша физичнская карта".tr(),
                  //             style: TextStyle(
                  //               color: AppColors.black,
                  //               fontSize: getHeight(18),
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //           content: Text(
                  //             barcode!.code ?? "",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               color: AppColors.black,
                  //               fontSize: getHeight(24),
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //           actions: [
                  //             MyElevatedButton(
                  //               height: getHeight(52),
                  //               width: getWidth(223),
                  //               sideColor: AppColors.whiteColor,
                  //               primaryColor: AppColors.orangeColor,
                  //               text: "Добавить".tr(),
                  //               textColor: AppColors.whiteColor,
                  //               onPressed: () {
                  //                 GetStorage().write("barcode", barcode!.code);
                  //                 Navigator.pop(context);
                  //                 Navigator.pop(context);
                  //                 setState(() {});
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //     // Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      );

  Widget tabbuildResult() => Container(
        alignment: Alignment.center,
        height: getHeight(275),
        width: getWidth(526),
        padding: const EdgeInsets.all(55),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              barcode != null
                  ? "Result:".tr() + " ${barcode!.code}"
                  : "Scan a code!".tr(),
              style: TextStyle(
                fontSize: getHeight(30),
                fontWeight: FontWeight.w500,
              ),
            ),
            MyElevatedButton(
              height: 64,
              width: 280,
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Закрыть".tr(),
              textSize: 32,
              textColor: AppColors.whiteColor,
              onPressed: () {
                if (barcode!.code != null) {
                  const Duration(seconds: 2);
                  debugPrint("Duration dan otdi ${barcode!.code}");
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsPadding: const EdgeInsets.all(45),
                        alignment: Alignment.center,
                        elevation: 2,
                        title: Text(
                          "Ваша физичнская карта".tr(),
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: getHeight(30),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        content: Text(
                          barcode!.code ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: getHeight(50),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        actions: [
                          MyElevatedButton(
                            height: getHeight(52),
                            width: getWidth(223),
                            sideColor: AppColors.whiteColor,
                            primaryColor: AppColors.orangeColor,
                            text: "Добавить",
                            textColor: AppColors.whiteColor,
                            onPressed: () {
                              GetStorage().write("barcode", barcode!.code);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen(
      (barcode) => setState(
        () => this.barcode = barcode,
      ),
    );
  }

  tabShowSuccseccDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.all(45),
          alignment: Alignment.center,
          elevation: 2,
          title: Text(
            "Карта успешно добавлена",
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(30),
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(
            "Вернуться на главную",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(50),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "add",
              textColor: AppColors.whiteColor,
              onPressed: () {
                // GetStorage().write("barcode", barcode!.code);
                Navigator.pop(context);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  showSuccseccDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsOverflowButtonSpacing: 5,
          actionsPadding: const EdgeInsets.all(8),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          alignment: Alignment.center,
          elevation: 2,
          content: Text(
            "Карта успешно добавлена",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(20),
              fontWeight: FontWeight.w500,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Вернуться на главную",
              textColor: AppColors.whiteColor,
              onPressed: () {
                GetStorage().write("barcode", barcode!.code);
                Navigator.pop(context);
                // Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  showErrorDialog(String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsOverflowButtonSpacing: 5,
          actionsPadding: const EdgeInsets.all(8),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          alignment: Alignment.center,
          elevation: 2,
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(20),
              fontWeight: FontWeight.w500,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Закрыть",
              textColor: AppColors.whiteColor,
              onPressed: () {
                // GetStorage().write("barcode", barcode!.code);
                Navigator.pop(context);
                // Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class ShowAlertDialogWidget {
  static Future ShowAlertDialog({
    required BuildContext context,
    required String contentText,
    required String buttonText,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          elevation: 2,
          content: Text(
            "Сообщение успешно отправлено".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getHeight(24),
              fontWeight: FontWeight.w400,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            MyElevatedButton(
              height: getHeight(52),
              width: getWidth(223),
              sideColor: AppColors.whiteColor,
              primaryColor: AppColors.orangeColor,
              text: "Вернуться на главную".tr(),
              textColor: AppColors.whiteColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

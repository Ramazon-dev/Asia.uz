import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class TabMyBottomSheet extends StatelessWidget {
  TabMyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListTile(
      onTap: () {
        showAppeals(context);
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Выберите тип обращения*'.tr(),
            style: TextStyle(
              color: AppColors.teal,
              fontSize: getWidth(24.0),
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.teal,
            size: getHeight(20),
          ),
        ],
      ),
      subtitle: Divider(
        height: getHeight(3.0),
        color: AppColors.teal,
      ),
    ).symmetric(
      horizontal: getWidth(50),
    );
  }

  showAppeals(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            getWidth(15.0),
          ),
          topRight: Radius.circular(
            getHeight(15.0),
          ),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: getHeight(500.0),
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: getWidth(65.0),
                  color: AppColors.teal,
                ),
              ),
              SizedBox(height: getHeight(20.0)),
              SizedBox(
                child: Text(
                  "Тип обращения".tr(),
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: getWidth(32.0),
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(300.0),
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            names[index].toString().tr(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: getHeight(24.0),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ).symmetric(horizontal: getWidth(45)),
                        Divider(
                          height: getHeight(3.0),
                          color: AppColors.teal,
                        ).symmetric(horizontal: getWidth(45.0)),
                      ],
                    );
                  },
                ),
              ),
              MyElevatedButton(
                text: 'Сохранить'.tr(),
                onPressed: () {
                  Navigator.pop(context);
                },
                height: 73,
                width: 473.0,
                primaryColor: AppColors.transparentColor,
                sideColor: AppColors.orangeColor,
                radius: getHeight(30),
                textSize: 32,
                sideWidth: getWidth(2),
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> names = [
    'Вопрос',
    'Жалоба',
    'Предложение',
    'Благодарность',
    'Другое',
  ];
}

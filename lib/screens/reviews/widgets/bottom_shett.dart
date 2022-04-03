import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showAppeals(context);
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Выберите тип обращения*',
            style: TextStyle(
              color: AppColors.teal,
              fontSize: getWidth(16.0),
              fontWeight: FontWeight.w400,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.teal,
          ),
        ],
      ),
      subtitle: Divider(
        height: getHeight(1.0),
        color: AppColors.teal,
      ),
    ).symmetric(
      horizontal: getWidth(10.0),
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
                  size: getWidth(45.0),
                  color: AppColors.teal,
                ),
              ),
              SizedBox(height: getHeight(10.0)),
              SizedBox(
                child: Text(
                  "Тип обращения",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: getWidth(22.0),
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
                            names[index].toString(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: getWidth(16.0),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Divider(
                          height: getHeight(2.0),
                          color: AppColors.teal,
                        ).symmetric(horizontal: getWidth(15.0)),
                      ],
                    );
                  },
                ),
              ),
              MyElevatedButton(
                text: 'Сохранить',
                onPressed: () {
                  Navigator.pop(context);
                },
                height: 50.0,
                // width: 161.0,
                primaryColor: AppColors.transparentColor,
                sideColor: AppColors.orangeColor,
                radius: 15.0,
                sideWidth: 2.0,
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

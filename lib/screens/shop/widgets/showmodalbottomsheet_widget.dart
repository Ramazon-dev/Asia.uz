import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class ShowModalBottomSheetWidget extends StatefulWidget {
  const ShowModalBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<ShowModalBottomSheetWidget> createState() =>
      _ShowModalBottomSheetWidgetState();
}

class _ShowModalBottomSheetWidgetState
    extends State<ShowModalBottomSheetWidget> {
  List<String> listOfStrings = [
    "Ташкент",
    "Навои",
    "Андижан",
    "Наманган",
    "Нукус",
    "Фергана",
    "Бухара",
    "Самарканд",
    "Ташкент",
  ];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: getHeight(320),
      width: getWidth(375),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                shopsModalBottomSheet();
              },
            ),
            // TextFormField(
            //   // controller: controller,
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     hoverColor: AppColors.textFormField,
            //     focusColor: AppColors.textFormField,
            //     label: const Icon(
            //       Icons.search,
            //       color: AppColors.textFormField,
            //     ),
            //     disabledBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(
            //         color: AppColors.textFormField,
            //       ),
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(
            //         color: AppColors.textFormField,
            //       ),
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     border: OutlineInputBorder(
            //       borderSide: const BorderSide(
            //         color: AppColors.textFormField,
            //       ),
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            // ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: MyTextWidget(text: "Магазин", fontSize: getHeight(18)),
              trailing: Icon(Icons.arrow_forward_ios, size: getHeight(15)),
              onTap: () {
                shopsModalBottomSheet();
              },
            ),
            const Divider(thickness: 1.5),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: MyTextWidget(text: "Город", fontSize: getHeight(18)),
              trailing: Icon(Icons.arrow_forward_ios, size: getHeight(15)),
              onTap: () {
                gorodBottomSHeet(context);
              },
            ),
            const Divider(thickness: 1.5),
            SizedBox(
              height: getHeight(12),
            ),
            MyElevatedButton(
              text: "Сохранить",
              sideColor: AppColors.orange,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  gorodBottomSHeet(BuildContext context) {
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
            Container(
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
                            color: AppColors.black, size: getHeight(15)),
                        onTap: () {},
                      ),
                      const Divider(thickness: 1.5),
                    ],
                  );
                },
              ),
            ),
            MyElevatedButton(
              text: "Сохранить",
              sideColor: AppColors.orange,
              onPressed: () {
                Navigator.pop(context);
              },
            ).only(top: getHeight(15)),
          ],
        ),
      ),
    );
  }

  shopsModalBottomSheet() {
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
                            color: AppColors.black, size: getHeight(15)),
                        onTap: () {},
                      ),
                      const Divider(thickness: 1.5),
                    ],
                  );
                },
              ),
            ),
            MyElevatedButton(
              text: "Сохранить",
              sideColor: AppColors.orange,
              onPressed: () {
                Navigator.pop(context);
              },
            ).only(top: getHeight(15)),
          ],
        ),
      ),
    );
  }
}

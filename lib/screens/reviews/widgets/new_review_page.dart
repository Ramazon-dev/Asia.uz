import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/reviews/widgets/bottom_shett.dart';
import 'package:flutter/material.dart';

class NewReviewPage extends StatelessWidget {
  NewReviewPage({Key? key}) : super(key: key);
  final TextEditingController _messangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getHeight(30.0)),
          SizedBox(
            width: getWidth(340.0),
            child: Text(
              "Любой ваш отзыв важен для нас.\nПоля, помеченные (*),\nобязательны для заполнения",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.black,
                fontSize: getWidth(18.0),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(21.0), vertical: getHeight(10.0)),
            child: MyTextFormFiels(
              hintText: "",
              labelText: "",
              prefixText: "",
              obscureText: true,
              prefixIcon: Icon(Icons.search),
              onChanged: (sa) {},
              radius: 20,
              sideColor: Colors.yellow,
              sideWidth: 20,
              validator: (c) {},
              controller: _messangeController,
            ),
          ),
          MyBottomSheet(),
          MyElevatedButton(
            text: 'Продолжить', textSize: getHeight(18),
            onPressed: () {},
            height: 50.0,
            // width: 161.0,
            primaryColor: AppColors.transparentColor,
            sideColor: AppColors.orangeColor,
            radius: 15.0,
            sideWidth: 2.0,
          ),
          SizedBox(height: getHeight(20.0)),
          Text(
            "Также вы можете обратиться в службу технической поддержки",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: getWidth(16.0),
            ),
          ),
          SizedBox(height: getHeight(20.0)),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getWidth(30.0),
                ),
              ),
              fixedSize: Size(
                getWidth(285.0),
                getHeight(50.0),
              ),
              side: BorderSide(
                color: AppColors.black,
                width: getWidth(1.0),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(SvgIcons.phone),
                SizedBox(width: getWidth(25.0)),
                Text(
                  GetStorage().read('telNumber'),
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: getWidth(16.0),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

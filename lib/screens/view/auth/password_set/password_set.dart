import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/material.dart';

class PasswordSet extends StatefulWidget {
  const PasswordSet({Key? key}) : super(key: key);

  @override
  State<PasswordSet> createState() => _PasswordSetState();
}

class _PasswordSetState extends State<PasswordSet> {
  TextEditingController controller = TextEditingController();

  String code = '';

  bool isActive = false;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bu page da foydalanuvchi app uchun password o'rnatadi
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            // color: Colors.yellow,
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.only(
            top: getHeight(183),
            left: getWidth(75),
            right: getWidth(75),
          ),
          child: Column(
            children: [
              MyTextWidget(text: 'Установите PIN-код'.tr())
                  .only(bottom: getHeight(50)),
              PinFieldAutoFill(
                codeLength: 4,
                autoFocus: true,
                controller: controller,
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: const FixedColorBuilder(
                    AppColors.teal,
                  ),
                  radius: Radius.circular(getHeight(10)),
                ),
                currentCode: code,
                onCodeChanged: (code) async {
                  // shu yerdan passwordni kegingi page ga jonatiladi
                  if (code!.length == 4) {
                    isActive = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReturnPassword(text: controller.text),
                      ),
                    );
                  }
                },
              ).only(bottom: getHeight(250)),
            ],
          ),
        ),
      ),
    );
  }
}

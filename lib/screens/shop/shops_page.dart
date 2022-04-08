import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/shop/local_auth_api.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyElevatedButton(
                onPressed: () {},
                text: "Check available",
              ).only(bottom: 50),
            ],
          ),
        ),
      ),
    );
  }
}

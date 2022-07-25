import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/screens/home/face_id_api.dart';
import 'package:flutter/material.dart';

class FaceId extends StatelessWidget {
  const FaceId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyElevatedButton(
          text: "Face ID",
          onPressed: () async {
            final authenticated = await LocalAuth.authenticate();
            if (authenticated) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
              final snackBar = SnackBar(
                // duration: const Duration(milliseconds: 500),
                content: const Text('royxatdan otdik'),
                backgroundColor: (Colors.white),
                action: SnackBarAction(
                  label: 'dismiss',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            final snackBar = SnackBar(
              content: const Text('code xato kiritildi'),
              backgroundColor: (Colors.red),
              action: SnackBarAction(
                label: 'Error',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            // setState(() {});
          },
        ),
      ),
    );
  }
}

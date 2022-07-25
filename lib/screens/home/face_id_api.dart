import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometric() async {
    try {
      return _auth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometric();
    if (!isAvailable) return false;
    try {
      return await _auth.authenticate(
        androidAuthStrings: const AndroidAuthMessages(
          signInTitle: "Face ID Required",
        ),
        localizedReason: "",
        useErrorDialogs: true,
        iOSAuthStrings: const IOSAuthMessages(
          goToSettingsButton: "sozlamalarga o'tish",
          cancelButton: "ortga",
          goToSettingsDescription: "Discription",
        ),
        stickyAuth: true,
      );
    } catch (e) {
      return false;
    }
  }
}

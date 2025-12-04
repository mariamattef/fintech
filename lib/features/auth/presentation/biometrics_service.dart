import 'package:fintech/features/auth/presentation/screens/faceid_verified_screen.dart';
import 'package:fintech/features/auth/presentation/screens/fingure_verified_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';

Future<void> authFingerprint(BuildContext context) async {
  final LocalAuthentication auth = LocalAuthentication();
  List<BiometricType> availableBiometrics;
  try {
    availableBiometrics = await auth.getAvailableBiometrics();
  } on PlatformException catch (e) {
    availableBiometrics = <BiometricType>[];
    if (kDebugMode) {
      print(e);
    }
  }

  if (kDebugMode) {
    print('Available biometrics: $availableBiometrics');
  }

  final bool isSupported = await auth.isDeviceSupported();

  if (!isSupported) {
    Fluttertoast.showToast(msg: "Device does not support biometrics");
    return;
  }

  if (!availableBiometrics.contains(BiometricType.fingerprint) &&
      !availableBiometrics.contains(BiometricType.strong)) {
    Fluttertoast.showToast(
      msg: "No fingerprint enrolled. Please set up fingerprint in settings.",
    );
    return;
  }

  try {
    final bool didAuthenticate = await auth.authenticate(
      localizedReason:
          'Please authenticate using Fingerprint to login to Fintech App',
      options: const AuthenticationOptions(biometricOnly: true),
    );

    if (didAuthenticate) {
      Navigator.pushNamed(context, FingureVerifiedScreen.routeName);
    } else {
      Fluttertoast.showToast(msg: "Authentication failed");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Error during authentication: ${e.toString()}");
  }
}

Future<void> authFaceId(BuildContext context) async {
  final LocalAuthentication auth = LocalAuthentication();
  List<BiometricType> availableBiometrics;
  try {
    availableBiometrics = await auth.getAvailableBiometrics();
  } on PlatformException catch (e) {
    availableBiometrics = <BiometricType>[];
    if (kDebugMode) {
      print(e);
    }
  }

  if (kDebugMode) {
    print('Available biometrics: $availableBiometrics');
  }

  final bool isSupported = await auth.isDeviceSupported();

  if (!isSupported) {
    Fluttertoast.showToast(msg: "Device does not support biometrics");
    return;
  }

  if (!availableBiometrics.contains(BiometricType.face) &&
      !availableBiometrics.contains(BiometricType.strong)) {
    Fluttertoast.showToast(
      msg: "No face ID enrolled. Please set up face ID in settings.",
    );
    return;
  }

  try {
    final bool didAuthenticate = await auth.authenticate(
      localizedReason:
          'Please authenticate using Face ID to login to Fintech App',
      options: const AuthenticationOptions(biometricOnly: true),
    );

    if (didAuthenticate) {
      Navigator.pushNamed(context, FaceidVerifiedScreen.routeName);
    } else {
      Fluttertoast.showToast(msg: "Authentication failed");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Error during authentication: ${e.toString()}");
  }
}


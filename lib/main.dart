import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/app.dart';
import 'package:test_app/core/ioc/global.dart';
import 'package:test_app/core/utils/colors.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: bBlack.withOpacity(0.1),
  ));
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.release");
  } else if (kProfileMode) {
    await dotenv.load(fileName: ".env.profile");
  } else {
    await dotenv.load(fileName: ".env");
  }
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  configureDependencies();

  await initGetStorage();

  runApp(const MyApp());
}

Future<void> initGetStorage() async {
  await GetStorage.init();
}

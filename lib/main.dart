import 'package:flutter/material.dart';
import 'package:shop_app/app/my_app.dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/helpers/dio_helper.dart';
import 'package:shop_app/utilities/helpers/shared_preference_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  DioHelper.init();

  runApp(const MyApp());
}

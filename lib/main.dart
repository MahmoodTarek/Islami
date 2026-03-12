import 'package:flutter/material.dart';
import 'package:islami/data/app_launch_service.dart';
import 'package:islami/islami_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirst = await AppLaunchService.isFirstLaunch();

  runApp(IslamiApp(isFirstLaunch: isFirst));
}

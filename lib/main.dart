import 'package:flutter/material.dart';
import 'package:islami/islami_app.dart';
import 'package:islami/utils/app_launch_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirst = await AppLaunchService.isFirstLaunch();
  runApp(IslamiApp(isFirstLaunch: isFirst));
}
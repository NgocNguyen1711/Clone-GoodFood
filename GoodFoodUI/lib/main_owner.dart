import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/app_config.dart';
import 'package:good_food/app_runner.dart';

import 'srcs/common/environment.dart';

@pragma('vm:entry-point')
Future<void> handleOnBackgroundMesage(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(handleOnBackgroundMesage);
  AppConfig(env: Env.owner());
  AppRunner.instance.run();
}

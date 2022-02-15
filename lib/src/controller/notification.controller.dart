import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  // FirebaseMessaging messageing = FirebaseMessaging();
  FirebaseMessaging messageing = FirebaseMessaging.instance;
  RxMap<String, dynamic> message = Map<String, dynamic>().obs;
  void onInit() {
    _initNotification();
    _getToken();
    super.onInit();
  }

  Future<void> _getToken() async {
    try {
      String? token = await messageing.getToken();
      print("token : $token");
    } catch (e) {}
  }

  Future<void> _initNotification() async {
    // messageing.requestNotificationPermissions(const IosNotificationSettings(
    await messageing.requestPermission(alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true);

    // messageing
    // messageing.configure(
    //     onMessage: _onMessage, onLaunch: _onLunch, onResume: _onResum);

  }

//메ㅣ지
  Future<void>? _onMessage(Map<String, dynamic> message) {
    print("_onMessage : $message");
    return null;
  }

//실행시
  Future<void>? _onLunch(Map<String, dynamic> message) {
    print("_onLunch : $message");
    _actionOnNotification(message);
    return null;
  }

  void _actionOnNotification(Map<String, dynamic> messageMap) {
    message(messageMap);
  }

  //앱이 백그라운드로 돌아가는 상태
  Future<void>? _onResum(Map<String, dynamic> message) {
    print("_onResum : $message");
    return null;
  }
}

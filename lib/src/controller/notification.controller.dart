import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  FirebaseMessaging messageing = FirebaseMessaging();

  @override
  void onInit() {
    _initNotification();
    _getToken();
    super.onInit();
  }

  Future<void> _getToken() async {
    try {
      String token = await messageing.getToken();
      print("token : $token");
    } catch (e) {}
  }

  void _initNotification() {
    messageing.requestNotificationPermissions(const IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));

    messageing.configure(
        onMessage: _onMessage, onLaunch: _onLunch, onResume: _onResum);
  }

//메ㅣ지
  Future<void>? _onMessage(Map<String, dynamic> message) {
    print("_onMessage : $message");
    return null;
  }

//실행시
  Future<void>? _onLunch(Map<String, dynamic> message) {
    print("_onLunch : $message");
    return null;
  }

  //앱이 백그라운드로 돌아가는 상태
  Future<void>? _onResum(Map<String, dynamic> message) {
    print("_onResum : $message");
    return null;
  }
}

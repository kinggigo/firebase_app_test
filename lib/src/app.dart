import 'package:firebase_message_test/src/controller/notification.controller.dart';
import 'package:firebase_message_test/src/page/message_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("fitebase cloud message"),
      ),
      body: Obx(() {
        if (NotificationController.to.message.isNotEmpty) {
          return MessageBox();
        }

        return Container();
      }),
    );
  }
}

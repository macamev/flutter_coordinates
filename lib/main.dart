import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
runApp(
  GetMaterialApp(
    initialRoute: "/",
    getPages: [
      GetPage(name: "/", page: () => StepScreen()),
      GetPage(name: "/steps/:stepId", page: () => StepScreen()),
    ],
  ),
);
}

class StepScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  int step = Get.parameters["stepId"] != null ? int.parse(Get.parameters["stepId"]!) : 0;
  return Scaffold(
    body: Center(
      child: OutlinedButton(
        onPressed: () => Get.toNamed("/steps/${step + 1}"),
        child: Text("To step ${step + 1}"),
      ),
    ),
  );
}
}
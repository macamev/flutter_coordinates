import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
runApp(
  GetMaterialApp(
      initialRoute: "/x/0/y/0",  // Start at (0, 0)
      getPages: [
        GetPage(name: "/x/:x/y/:y", page: () => StepScreen()),
    ],
  ),
);
}

class StepScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  // Get the x and y coordinates from the URL parameters
    int xCoord = int.parse(Get.parameters["x"]!);
    int yCoord = int.parse(Get.parameters["y"]!);

  return Scaffold(
  appBar: AppBar(title: Text("Maze Navigation")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        children: [
          Text(
              "You are at ($xCoord, $yCoord)", 
              style: TextStyle(fontSize: 24),
            ),

          ElevatedButton(
          onPressed: () => Get.toNamed("/x/$xCoord/y/${yCoord + 1}"),
          child: Text("Up"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: () => Get.toNamed("/x/${xCoord - 1}/y/$yCoord"),
              child: Text("Left"),
              ),

              ElevatedButton(
              onPressed: () => Get.toNamed("/x/$xCoord/y/${yCoord - 1}"),
              child: Text("Down"),
              ),

              ElevatedButton(
              onPressed: () => Get.toNamed("/x/${xCoord + 1}/y/$yCoord"),
              child: Text("Right"),
              ),
            ]
            
          )
      ],
      )
      
    ),
  );
}
}
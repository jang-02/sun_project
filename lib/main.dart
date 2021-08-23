import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sun_project/src/app.dart';
import 'package:sun_project/src/controller/get_example_controller.dart';
import 'package:sun_project/src/controller/napi_controller.dart';
import 'package:sun_project/src/controller/sst_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(NaverApiController());
        Get.put(SunsetTimeController());
        Get.put(LocationController());
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sun_project/src/controller/napi_controller.dart';

import 'controller/get_example_controller.dart';
import 'controller/sst_controller.dart';

class App extends GetView<NaverApiController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(SunsetTimeController());
    // Get.put(LocationController());
    return Scaffold(
      appBar: AppBar(
        title: Text('loc'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          var info = controller.naverapiStatistic.value;
          var sstinfo =
              Get.find<SunsetTimeController>().sunsetTimeStatistic.value;
          var locinfo = Get.find<LocationController>().locationData.value;

          return Column(
            children: [
              Row(
                children: [
                  Text(
                    "위치",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "${info.area1}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "${info.area2}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "${sstinfo.sunset}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "${locinfo.lati}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "${locinfo.long}",
                    style: TextStyle(fontSize: 15),
                  ),
                  // Text(
                  //   "${info.name}",
                  //   style: TextStyle(fontSize: 15),
                  // ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

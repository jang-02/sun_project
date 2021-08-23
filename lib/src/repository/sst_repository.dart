import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sun_project/src/controller/get_example_controller.dart';
import 'package:sun_project/src/model/sst.dart';
import 'package:xml/xml.dart';
import 'package:sun_project/src/app.dart';

class SunsetTimeRepository {
  final dateStr = DateFormat('yyyyMMdd').format(DateTime.now());
  late var _dio;
  final LocationController c = Get.put(LocationController());
  var locinfo2 = Get.find<LocationController>().locationData.value;
  SunsetTimeRepository() {
    print(locinfo2.lati);
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://apis.data.go.kr",
        queryParameters: {
          'ServiceKey':
              'cR1YY2ji2HzxD35o6BnH7GgH46ViNYaXmUFWJ/KKXc+MYcZNA51AWWyKOPorXp8pHJ6gBLiaXzJ809NDVwgNSg==',
          'locdate': dateStr,
          'longitude': '126.932126',
          'latitude': '37.559978',
          'dnYn': 'Y'
        },
      ),
    );
  }

  Future<SunsetTimeModel> fetchSunSetTimeStatistics() async {
    var response2 = await _dio
        .get('/B090041/openapi/service/RiseSetInfoService/getLCRiseSetInfo');
    print(response2.data);
    final document = XmlDocument.parse(response2.data);
    final items = document.findAllElements('item');
    if (items.isNotEmpty) {
      return SunsetTimeModel.fromXml(items.first);
    } else {
      return Future.value(null);
    }
  }
}

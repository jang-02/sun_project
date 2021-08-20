import 'package:dio/dio.dart';
import 'package:sun_project/src/repository/addressxml.dart';

class NaverApiRepository {
  AddressXml addressxml = AddressXml(
      'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=128.12345,37.98776&sourcecrs=epsg:4326&output=xml');

  // late var _dio;
  // LocationRepository() {
  //   _dio = Dio(BaseOptions(
  //       baseUrl: "https://naveropenapi.apigw.ntruss.com",
  //       queryParameters: {
  //         'request': 'coordsToaddr',
  //         'coords': '128.12345,37.98776',
  //         'sourcecrs': 'epsg:4326',
  //         'output': 'xml',
  //       }));
  // }

  fetchNaverApiStatistics() async {
    var response = await addressxml.getXmlData();
    print(response);
  }
}

import 'package:dio/dio.dart';
import 'package:sun_project/src/model/napi.dart';
import 'package:sun_project/src/repository/addressxml.dart';
import 'package:xml/xml.dart';

class NaverApiRepository {
  AddressXml addressxml = AddressXml(
      'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=128.12345,37.98776&sourcecrs=epsg:4326&output=xml');

//주의해서 한번 봐바

  Future<NaverApiModel> fetchNaverApiStatistics() async {
    var response = await addressxml.getXmlData();
    var xmlData = XmlDocument.parse(response);
    final results = xmlData.findAllElements('results');
    final names = xmlData.findAllElements('name');
    // var naverinfo = <NaverApiModel>[];
    // names.forEach((node) {
    //   naverinfo.add(NaverApiModel.fromXml(node));
    //   node.findAllElements('name').map((e) => e.text).forEach(print);
    // });
    // print(naverinfo);

    if (results.isNotEmpty) {
      return NaverApiModel.fromXml(results.first);
    } else {
      return Future.value(null);
    }
  }
}

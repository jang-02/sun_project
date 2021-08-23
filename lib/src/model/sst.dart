import 'package:sun_project/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class SunsetTimeModel {
  String? sunset;
  String? sunrise;
  SunsetTimeModel({this.sunset, this.sunrise});

  factory SunsetTimeModel.fromXml(XmlElement sstxml) {
    return SunsetTimeModel(
        sunset: SstXmlUtils.searchResult(sstxml, 'sunset'),
        sunrise: SstXmlUtils.searchResult(sstxml, 'sunrise'));
  }
}

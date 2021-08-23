import 'package:sun_project/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class NaverApiModel {
  String? area1;
  String? area2;
  // String? name;
  NaverApiModel({
    this.area1,
    this.area2,
  });

  factory NaverApiModel.fromXml(XmlElement xml) {
    return NaverApiModel(
        area1: XmlUtils.searchResult(xml, 'area1'),
        area2: XmlUtils.searchResult(xml, 'area2'));
    // name: XmlUtils.searchResult(xml, 'name'));
  }
}

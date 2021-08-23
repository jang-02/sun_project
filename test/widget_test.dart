// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart';

void main() {
  final bookshelfXml =
      '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <aste>2048  </aste>
                <astm>0420  </astm>
                <civile>1942  </civile>
                <civilm>0527  </civilm>
                <latitude>3733</latitude>
                <latitudeNum>37.5500000</latitudeNum>
                <location>서울</location>
                <locdate>20210823</locdate>
                <longitude>12658</longitude>
                <longitudeNum>126.9666660</longitudeNum>
                <moonrise>2004  </moonrise>
                <moonset>0614  </moonset>
                <moontransit>0050  </moontransit>
                <naute>2014  </naute>
                <nautm>0454  </nautm>
                <sunrise>0555  </sunrise>
                <sunset>1914  </sunset>
                <suntransit>123444</suntransit>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>1</totalCount>
    </body>
</response>''';

  test('시간통계', () {
    final document = XmlDocument.parse(bookshelfXml);
    final items = document.findAllElements('item');

    items.forEach((node) {
      node.findAllElements('sunset').map((e) => e.text).forEach(print);
      // print(node.findAllElements('name').map((e) => e.text).first);
    });
  });
}

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

class SstXmlUtils {
  static String searchResult(XmlElement sstxml, String key) {
    return sstxml.findAllElements(key).map((e) => e.text).isEmpty
        ? ""
        : sstxml.findAllElements(key).map((e) => e.text).first;
  }
}

class XmlUtils {
  static String searchResult(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? ""
        : xml.findAllElements(key).map((e) => e.text).first;
  }
}

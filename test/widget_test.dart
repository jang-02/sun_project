// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart';

void main() {
  final bookshelfXml = '''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <geocoding>
        <status>
            <code>0</code>
            <name>ok</name>
            <message>done</message>
        </status>
        <results>
            <order>
                <name>legalcode</name>
                <code>
                    <id>4281031024</id>
                    <type>L</type>
                    <mappingId>0181031024</mappingId>
                </code>
                <region>
                    <area0>
                        <name>kr</name>
                        <alias/>
                        <coords/>
                    </area0>
                    <area1>
                        <name>강원도</name>
                        <alias>강원</alias>
                        <coords>
                            <center>
                                <crs>EPSG:4326</crs>
                                <x>128.3115261</x>
                                <y>37.8603672</y>
                            </center>
                        </coords>
                    </area1>
                    <area2>
                        <name>인제군</name>
                        <alias/>
                        <coords>
                            <center>
                                <crs>EPSG:4326</crs>
                                <x>128.170352</x>
                                <y>38.069732</y>
                            </center>
                        </coords>
                    </area2>
                    <area3>
                        <name>남면</name>
                        <alias/>
                        <coords>
                            <center>
                                <crs>EPSG:4326</crs>
                                <x>128.083362</x>
                                <y>37.965968</y>
                            </center>
                        </coords>
                    </area3>
                    <area4>
                        <name>부평리</name>
                        <alias/>
                        <coords>
                            <center>
                                <crs>EPSG:4326</crs>
                                <x>128.1122362</x>
                                <y>37.992805</y>
                            </center>
                        </coords>
                    </area4>
                </region>
            </order>
            <order>
                <name>admcode</name>
                <code>
                    <id>4281031000</id>
                    <type>L</type>
                    <mappingId>01810310</mappingId>
                </code>
                <region>
                    <area0>
                        <name>kr</name>
                        <alias/>
                        <coords/>
                    </area0>
                    <area1>
                        <name>강원도</name>
                        <alias>강원</alias>
                        <coords>
                            <center>
                                <crs>EPSG:4326</crs>
                                <x>128.3115261</x>
                                <y>37.8603672</y>
                            </center>
                        </coords>
                    </area1>
                    <area2>
                        <name>인제군</name>
                        <alias/>
                        <coords>
                            <center>
                                <crs>EPSG:4326</crs>
                                <x>128.170352</x>
                                <y>38.069732</y>
                            </center>
                        </coords>
                    </area2>
                    <area3>
                        <name>남면</name>
                        <alias/>
                        <coords>
                            <center>
                                <crs>EPSG:4326</crs>
                                <x>128.083362</x>
                                <y>37.965968</y>
                            </center>
                        </coords>
                    </area3>
                    <area4/>
                </region>
            </order>
        </results>
    </geocoding>''';

  test('시간통계', () {
    final document = XmlDocument.parse(bookshelfXml);
    final results = document.findAllElements('results');
    var locationInfo = <LocModel>[];
    results.forEach((node) {
      locationInfo.add(LocModel.fromXml(node));
      node.findAllElements('name').map((e) => e.text).forEach(print);
    });
    print(locationInfo.length);
    locationInfo.forEach((location) {
      print(location.area1?.substring(25, 28));
    });
  });
}

class LocModel {
  String? area1;
  String? area2;
  LocModel({this.area1, this.area2});

  factory LocModel.fromXml(XmlElement xml) {
    return LocModel(
        area1: XmlUtils.searchResult(xml, 'area1'),
        area2: XmlUtils.searchResult(xml, 'area2'));
  }
}

class XmlUtils {
  static String searchResult(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? ""
        : xml.findAllElements(key).map((e) => e.text).first;
  }
}

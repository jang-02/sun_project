import 'package:xml/xml.dart';

class XmlUtils {
  static String searchResult(XmlElement xml, String key) {
    final areaResult = xml.findAllElements(key);
    var loclist = [];
    areaResult.forEach((node) {
      loclist.add(node.findAllElements('name').map((e) => e.text).first);
    });
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? ""
        : loclist[0];
  }
}

class SstXmlUtils {
  static String searchResult(XmlElement sstxml, String key) {
    return sstxml.findAllElements(key).map((e) => e.text).isEmpty
        ? ""
        : sstxml.findAllElements(key).map((e) => e.text).first;
  }
}

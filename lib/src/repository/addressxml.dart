import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:xml/xml.dart';

class AddressXml {
  final String url;
  AddressXml(this.url);

  Map<String, String> test = {
    "X-NCP-APIGW-API-KEY-ID": "s27cogiacm",
    "X-NCP-APIGW-API-KEY": "BVUEN9GXwlLUmTiiQHIZbCq0D4Jeuitoca9JSn8J"
  };

  Future<dynamic> getXmlData() async {
    http.Response response = await http.get(Uri.parse(url), headers: test);
    var asdf = utf8.decode(response.bodyBytes);
    var xmlData = XmlDocument.parse(asdf);

    return asdf;
  }
}

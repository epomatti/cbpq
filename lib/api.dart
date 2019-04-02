import 'package:http/http.dart' as http;
import 'package:cbpq/url_helper.dart';
import 'package:xml/xml.dart' as xml;

class Api {

  Future call() async {
    String url = UrlHelper().urlCbpq('90155');
    http.read(url).then((text) {
      String newXml = removeHead(text);

      newXml = newXml.replaceFirst(' class=\"\"', '');
      newXml = newXml.replaceFirst('<!DOCTYPE html>', '');
      
      
      print(newXml);
      var document = xml.parse(newXml);
      print(document);
    });
  }

  String removeHead(String xml) {
    int start = xml.indexOf('<head>');
    int end = xml.indexOf('</head>') + 7;
    return xml.replaceRange(start, end, '');
  }
}

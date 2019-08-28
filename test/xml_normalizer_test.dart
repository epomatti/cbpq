import 'package:cbpq/api/url_helper.dart';
import 'package:cbpq/model/cbpq.dart';
import 'package:cbpq/xml/mapping.dart';
import 'package:cbpq/xml/xml_normalizer.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:xml/xml.dart' as xml;

void main() {
  consultarCbpq("123456");
}

Future<CBPQ> consultarCpf(String cpf) {
  String url = UrlHelper().urlCpf(cpf);
  return _read(url);
}

Future<CBPQ> consultarCbpq(String cbpq) {
  String url = UrlHelper().urlCbpq(cbpq);
  return _read(url);
}

Future<CBPQ> _read(String url) {
  return http.read(url).then((text) {
    String xmlClean = XmlNormalizer().normalize(text);
    XmlDocument xmlDocument = xml.parse(xmlClean);
    return Mapping().map(xmlDocument);
  });
}

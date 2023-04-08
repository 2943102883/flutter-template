import 'dart:convert';
import 'package:dio/dio.dart';

String cURLRepresentation(RequestOptions options, {bool convertFormData = true}) {
  List<String> components = ['curl -i'];
  if (options.method.toUpperCase() != 'GET') {
    components.add('-X ${options.method}');
  }

  options.headers.forEach((k, v) {
    if (k != 'Cookie') {
      components.add('-H "$k: $v"');
    }
  });

  if (options.data != null) {
    // FormData不能被JSON序列化，只保留它们的字段属性
    if (options.data is FormData && convertFormData == true) {
      options.data = Map.fromEntries(options.data.fields);
    }

    final data = json.encode(options.data).replaceAll('"', '\\"');
    components.add('-d "$data"');
  }

  components.add('"${options.uri.toString()}"');

  return components.join(' \\\n\t');
}
import 'dart:convert';
import 'dart:io';
import 'package:shared/models.dart';

class JsonFile {
  final String path;
  const JsonFile(this.path);

  Future<List<Product>> loadFile() async {
    var file = File(path);
    return (jsonDecode(await file.readAsString()) as List<dynamic>)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> writeFile(List<Map<String, dynamic>> products) async {
    var file = File('new_$path');
    await file.writeAsString(jsonEncode(products));
  }
}

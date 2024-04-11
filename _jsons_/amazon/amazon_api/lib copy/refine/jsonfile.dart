import 'dart:convert';
import 'dart:io';
import 'package:shared/models.dart';

class JsonFile {
  final String path;
  const JsonFile(this.path);

  Future<List<Product>> loadFile() async {
    var file = File(path);
    return (jsonDecode(await file.readAsString()) as List<dynamic>).map((e) {
      var map = e as Map<String, dynamic>;
      map.addAll({
        if (map['createdAt'] is String) 'createdAt': DateTime.parse(map['createdAt']).millisecondsSinceEpoch,
        if (map['lastUpdateAt'] is String)
          'lastUpdateAt': DateTime.parse(map['lastUpdateAt']).millisecondsSinceEpoch
      });
      return Product.fromJson((map));
    }).toList();
  }

  Future<void> writeFile(List<Map<String, dynamic>> products) async {
    var file = File('new_$path');
    await file.writeAsString(removeUnicodeCharacter(jsonEncode(products)));
  }
}

String removeUnicodeCharacter(String text) {
  return text.replaceAll('\u{200E}', '');
}

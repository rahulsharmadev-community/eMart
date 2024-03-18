import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/keyword_repository/keyword_repository.dart';

void main() async {
  test('adds one to input values', () async {
    final keyword = KeywordRepository();
    final result = await keyword.searchProduct('le');

    print(result);
  });
}

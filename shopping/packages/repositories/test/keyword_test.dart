import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/apis/keywords/keyword_api.dart';

void main() async {
  test('adds one to input values', () async {
    final keyword = KeywordsApi();
    final result = await keyword.search('le');

    print(result);
  });
}

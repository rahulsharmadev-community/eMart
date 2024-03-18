import 'dart:convert' as json;

import 'package:shared/models.dart';
import 'package:test/test.dart';

import 'json/products.dart';
import 'json/sellers.dart';

void main() {
  group('Product Validation\n\t- ', () {
    int i = 0;
    for (var map in productsJson) {
      test("Test - ${i++}", () {
        try {
          Product.fromJson(json.jsonDecode(json.jsonEncode(map["model"])));
          if (map["result"] == "fail") fail("Expected the test to fail, but it passed.");
        } on AssertionError catch (e) {
          if (map['result'] == 'pass') fail("Expected the test to pass, but it fails.\neror: ${e.message}");
        } catch (e) {
          fail("Unexpected error not cover by manually type: $e");
        }
      });
    }
  });

  group('Shop Validation\n\t- ', () {
    int i = 0;
    for (var map in shopsJson) {
      test("Test - ${i++}", () {
        try {
          Shop.fromJson(json.jsonDecode(json.jsonEncode(map["model"])));
          if (map["result"] == "fail") fail("Expected the test to fail, but it passed.");
        } on AssertionError catch (e) {
          if (map['result'] == 'pass') fail("Expected the test to pass, but it fails.\neror: ${e.message}");
        } catch (e) {
          fail("Unexpected error not cover by manually type: $e");
        }
      });
    }
  });
}

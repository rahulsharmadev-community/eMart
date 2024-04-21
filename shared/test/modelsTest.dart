// ignore: file_names
import 'dart:convert';

import 'package:shared/models.dart';


void main() {
  Map<String, dynamic> reviews = {
    '0393caeb-c625-4b51-a25c-e829ed8edfb4': Review(
      title: "Amazing Product!",
      text: "This product exceeded my expectations. It's well-built, durable, and looks great!",
      rating: 4.5,
      reviewedBy: "JohnDoe",
      imageUrls: ["https://example.com/image1.jpg", "https://example.com/image2.jpg"],
    ).toJson(),
    '088af770-8f60-4dca-9dd5-c3a958e59b0b': Review(
      title: "Disappointing Quality",
      text: "I was not satisfied with this product. The quality was poor and it broke easily.",
      rating: 2.0,
      reviewedBy: "JaneSmith",
    ).toJson(),
    '13b38bd2-7c67-431e-9e62-89566f1c9183': Review(
      title: "Great Value for Money",
      text: "This product is a steal for the price! It works perfectly and has all the features I need.",
      rating: 5.0,
      reviewedBy: "HappyCustomer123",
    ).toJson(),
    '250db886-7ff1-49cd-b7a0-c30970f67776': Review(
      title: "Average Product",
      text: "This product is neither great nor terrible. It gets the job done, but nothing special.",
      rating: 3.0,
      reviewedBy: "NeutralReviewer",
    ).toJson(),
    '272ade91-026b-499d-b954-2d29b05f4c7d': Review(
      title: "Excellent Customer Service",
      text:
          "I had an issue with my order, but the customer service team was very helpful and resolved it quickly.",
      rating: 4.5,
      reviewedBy: "SatisfiedCustomer",
    ).toJson(),
    '331e61b5-5862-4e99-a336-4b37db657862': Review(
      title: "Not Worth the Price",
      text: "I expected more for the price I paid. The product feels cheaply made.",
      rating: 2.5,
      reviewedBy: "BudgetBuyer",
    ).toJson(),
    'b4bb71ec-b644-4d81-ab9d-25efa925bd93': Review(
      title: "Fast Shipping",
      text: "I received my order sooner than expected. The shipping was quick and hassle-free.",
      rating: 4.0,
      reviewedBy: "SpeedyDelivery",
    ).toJson(),
    '876c8b5e-fe88-4562-a092-be3a66e1dd5a': Review(
      title: "Impressive Features",
      text: "This product has so many useful features! It's definitely worth the investment.",
      rating: 4.5,
      reviewedBy: "TechEnthusiast",
    ).toJson(),
    '9753ecea-194d-4e4a-8ab1-45bf730b7c6b': Review(
      title: "Poor Durability",
      text: "Unfortunately, this product did not last long. It broke after just a few uses.",
      rating: 2.0,
      reviewedBy: "FrustratedBuyer",
    ).toJson(),
    'b4bb71ec-b644-4d81-ab9d-25efa925bd92': Review(
      title: "Looks Better in Pictures",
      text: "The product looks much nicer in the pictures than it does in person. I'm a bit disappointed.",
      rating: 3.0,
      reviewedBy: "VisualBuyer",
    ).toJson(),
  };
  print(jsonEncode(reviews));

  // group('Product Validation\n\t- ', () {
  //   int i = 0;
  //   for (var map in productsJson) {
  //     test("Test - ${i++}", () {
  //       try {
  //         Product.fromJson(json.jsonDecode(json.jsonEncode(map["model"])));
  //         if (map["result"] == "fail") fail("Expected the test to fail, but it passed.");
  //       } on AssertionError catch (e) {
  //         if (map['result'] == 'pass') fail("Expected the test to pass, but it fails.\neror: ${e.message}");
  //       } catch (e) {
  //         fail("Unexpected error not cover by manually type: $e");
  //       }
  //     });
  //   }
  // });

  // group('Shop Validation\n\t- ', () {
  //   int i = 0;
  //   for (var map in shopsJson) {
  //     test("Test - ${i++}", () {
  //       try {
  //         Shop.fromJson(json.jsonDecode(json.jsonEncode(map["model"])));
  //         if (map["result"] == "fail") fail("Expected the test to fail, but it passed.");
  //       } on AssertionError catch (e) {
  //         if (map['result'] == 'pass') fail("Expected the test to pass, but it fails.\neror: ${e.message}");
  //       } catch (e) {
  //         fail("Unexpected error not cover by manually type: $e");
  //       }
  //     });
  //   }
  // });
}

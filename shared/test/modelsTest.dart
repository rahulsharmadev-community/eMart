
import 'package:shared/models.dart';


void main() {
  var product = Product(
      shopId: "shopid011",
      mrp: 2200,
      discount: 20,
      title: "JBL Tune 510BT",
      thumbnail: "https://m.media-amazon.com/images/I/41ULm0i+k7L._SX466_.jpg",
      unit: ProductUnit.piece(1),
      productBrand: "JBL",
      warrantyPeriod: DurationPeriod.year(1),
      category: ['headphone', 'soundbar'],
      afterSalesServiceId: "f16ee39d-2599-5d85-b7e2-72bacb17edfe",
      refund: DurationPeriod.day(7),
      replacement: DurationPeriod.day(7),
      keywords: ["JBL", "headphone"],
      status: ProductStockStatus.available,
      imageUrls: [
        "https://m.media-amazon.com/images/I/41ULm0i+k7L._SX466_.jpg",
        "https://m.media-amazon.com/images/I/41gLWKu5qkL._SX466_.jpg"
      ],
      shotDescription:
          "The JBL Tune 510BT headphones let you stream powerful JBL Pure Bass sound with no strings attached. Easy to use, these headphones provide up to 40 hours of pure pleasure and an extra 2 hours of battery with just 5 minutes of power with the USB-C charging cable. And if a call comes in while you are watching a video on another device, the JBL Tune 510BT seamlessly switches to your mobile. Bluetooth 5.0 enabled and designed to be comfortable, the JBL Tune 510BT headphones also allow you to connect to Siri or Google without using your mobile device. Available in multiple fresh colors and foldable for easy portability, the JBL Tune 510BT headphones are a grab ‘n go solution that helps you to inject music into every aspect of your busy life.",
      detailedSpecs: {
        "Brand": "JBL",
        "Model Name": "Tune",
        "Colour": "White",
        "Form Factor": "On Ear",
        "Connectivity Technology": "Wireless",
      },
      feature: [
        "Quick Charging",
        "Dual Pairing",
        "Bluetooth 5.0",
        "Voice Assistant Support",
      ],
      deliveryMetaData: {
        State.INAS: DeliveryMetaData(deliveryEstimation: DeliveryEstimation.tenToFifteen, deliveryCost: 20),
        State.INDL: DeliveryMetaData(deliveryEstimation: DeliveryEstimation.oneToTwo)
      },
      variants: [
        "productid1",
        "productid02",
      ]);
  print(Product.fromJson(product.toJson()));

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

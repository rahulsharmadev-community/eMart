var shopsJson = [
  {
    "result": "pass",
    "model": {
      "shopId": "1",
      "sellerId": "ValidSellerID123",
      "name": "Example Shop",
      "address": {
        "houseNo": "123 Main St",
        "country": "Cityville",
        "state": "Stateville",
        "pincode": "12345"
      },
      "email": "valid@example.com",
      "phoneNumber": "+1234567890",
      "rating": 4.5,
      "gstNumber": "GST123456",
      "gstDocImg": "https://example.com/gstdoc.jpg",
      "panNumber": "PAN123456",
      "panDocImg": "https://example.com/pandoc.jpg",
      "shopImgs": ["https://example.com/shopimg1.jpg", "https://example.com/shopimg2.jpg"],
      "isVerifiedShop": true,
      "electricityBillDocImg": "https://example.com/electricitybilldoc.jpg",
      "electricityBillNumber": "EBN123456",
      "createdAt": "2024-03-12T23:57:11.987654",
      "lastUpdateAt": "2024-03-12T23:57:11.987654"
    },
  },
  {
    "result": "fail",
    "reason": "Invalid seller ID intentionally for failure",
    "model": {
      "shopId": "2",
      "sellerId": "1234",
      "name": "Another Shop",
      "address": {
        "houseNo": "456 Market St",
        "country": "Townville",
        "state": "Stateville",
        "pincode": "56789"
      },
      "email": "another@example.com",
      "phoneNumber": "+9876543210",
      "rating": 3.2,
      "gstNumber": null,
      "gstDocImg": null,
      "panNumber": "PAN987654",
      "panDocImg": "https://example.com/anotherpandoc.jpg",
      "shopImgs": null,
      "isVerifiedShop": false,
      "electricityBillDocImg": null,
      "electricityBillNumber": null,
      "createdAt": "2024-03-12T23:57:11.987654",
      "lastUpdateAt": "2024-03-12T23:57:11.987654"
    },
  },
  {
    "result": "pass",
    "model": {
      "shopId": "3",
      "sellerId": "LongValidSellerID123456",
      "name": "Shop With Long Seller ID",
      "address": {
        "houseNo": "789 Commercial St",
        "country": "Businessville",
        "state": "Stateville",
        "pincode": "98765"
      },
      "email": "longseller@example.com",
      "phoneNumber": "+1122334455",
      "rating": 2.7,
      "gstNumber": "GST789012",
      "gstDocImg": "https://example.com/longgstdoc.jpg",
      "panNumber": "PAN789012",
      "panDocImg": "https://example.com/longpandoc.jpg",
      "shopImgs": ["https://example.com/shopimg3.jpg"],
      "isVerifiedShop": true,
      "electricityBillDocImg": "https://example.com/longelectricitybilldoc.jpg",
      "electricityBillNumber": "EBN789012",
      "createdAt": "2024-03-12T23:57:11.987654",
      "lastUpdateAt": "2024-03-12T23:57:11.987654"
    },
  },
  {
    "result": "fail",
    "reason": " Invalid email intentionally for failure",
    "model": {
      "shopId": "4",
      "sellerId": "ValidSellerID123",
      "name": "Invalid Email Shop",
      "address": {
        "houseNo": "321 Industrial St",
        "country": "Factoryville",
        "state": "Stateville",
        "pincode": "54321"
      },
      "email": "invalidemail",
      "phoneNumber": "+9988776655",
      "rating": 1.8,
      "gstNumber": null,
      "gstDocImg": null,
      "panNumber": "PAN543210",
      "panDocImg": "https://example.com/invalidpandoc.jpg",
      "shopImgs": ["https://example.com/shopimg4.jpg"],
      "isVerifiedShop": false,
      "electricityBillDocImg": null,
      "electricityBillNumber": null,
      "createdAt": "2024-03-12T23:57:11.987654",
      "lastUpdateAt": "2024-03-12T23:57:11.987654"
    },
  },
  {
    "result": "fail",
    "reason": " Invalid rating intentionally for failure",
    "model": {
      "shopId": "5",
      "sellerId": "ValidSellerID123",
      "name": "Invalid Rating Shop",
      "address": {
        "houseNo": "555 Park Avenue",
        "country": "Parkville",
        "state": "Stateville",
        "pincode": "55555"
      },
      "email": "park@example.com",
      "phoneNumber": "+1122334455",
      "rating": 6.2,
      "gstNumber": "GST555555",
      "gstDocImg": "https://example.com/gstpark.jpg",
      "panNumber": "PAN555555",
      "panDocImg": "https://example.com/panpark.jpg",
      "shopImgs": ["https://example.com/shopimg5.jpg"],
      "isVerifiedShop": true,
      "electricityBillDocImg": "https://example.com/electricitybillpark.jpg",
      "electricityBillNumber": "EBN555555",
      "createdAt": "2024-03-12T23:57:11.987654",
      "lastUpdateAt": "2024-03-12T23:57:11.987654"
    },
  },
  {
    "result": "pass",
    "model": {
      "shopId": "6",
      "sellerId": "ValidSellerID123",
      "name": "Shop Without GST and PAN",
      "address": {
        "houseNo": "666 Maple houseNo",
        "country": "Mapleville",
        "state": "Stateville",
        "pincode": "66666"
      },
      "email": "maple@example.com",
      "phoneNumber": "+1122334455",
      "rating": 3.9,
      "gstNumber": null,
      "gstDocImg": null,
      "panNumber": null,
      "panDocImg": null,
      "shopImgs": ["https://example.com/shopimg6.jpg"],
      "isVerifiedShop": true,
      "electricityBillDocImg": "https://example.com/electricitybillmaple.jpg",
      "electricityBillNumber": "EBN666666",
      "createdAt": "2024-03-12T23:57:11.987654",
      "lastUpdateAt": "2024-03-12T23:57:11.987654"
    },
  },
  {
    "result": "fail",
    "reason": "Invalid URL for GST Doc Img intentionally for failure",
    "model": {
      "shopId": "7",
      "sellerId": "ValidSellerID123",
      "name": "Invalid GST Doc Img URL",
      "address": {
        "houseNo": "777 Elm houseNo",
        "country": "Elmville",
        "state": "Stateville",
        "pincode": "77777"
      },
      "email": "elm@example.com",
      "phoneNumber": "+1122334455",
      "rating": 2.1,
      "gstNumber": "GST777777",
      "gstDocImg": "invalidurl",
      "panNumber": "PAN777777",
      "panDocImg": "https://example.com/panelm.jpg",
      "shopImgs": ["https://example.com/shopimg7.jpg"],
      "isVerifiedShop": false,
      "electricityBillDocImg": "https://example.com/electricitybillelm.jpg",
      "electricityBillNumber": "EBN777777",
      "createdAt": "2024-03-12T23:57:11.987654",
      "lastUpdateAt": "2024-03-12T23:57:11.987654"
    }
  }
] as List<Map<String, dynamic>>;

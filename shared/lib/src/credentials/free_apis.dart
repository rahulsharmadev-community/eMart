// SKDB: Search Keyword Database
class SKDB {
  static const List values = <SKDB>[
    SKDB._('aeimr',
        ref: 'https://neverdelete-01-default-rtdb.asia-southeast1.firebasedatabase.app',
        token: 'ETiyjIcTJiPKYUvi102QdtbpS2wO23jvBI3C26mQ'),
    SKDB._('bfjns',
        ref: 'https://never-delete-02-default-rtdb.asia-southeast1.firebasedatabase.app',
        token: 'JOCjDDjhD5VBUQ97SF2B1ajCa7lmbSoBXlwxcQhE'),
    SKDB._('cgkot',
        ref: 'https://never-delete-03-default-rtdb.asia-southeast1.firebasedatabase.app',
        token: 'n5Y9IdV2WxcVB2D9WV147sxwyGUTy1rG2L9CMCTk'),
    SKDB._('dhlpu',
        ref: 'https://never-delete-04-default-rtdb.asia-southeast1.firebasedatabase.app',
        token: '9MNiBKlEfzOSWQdB5VWNSl11FsI9q5c4XnVCM2zF'),
    SKDB._('qvwxyz',
        ref: 'https://never-delete-05-default-rtdb.asia-southeast1.firebasedatabase.app',
        token: 'TVRwHASiWbnO8LrkuLEOZMJ0Vy9IhltMtGcFXooV')
  ];

  final String ref, token, _code;

  const SKDB._(this._code, {required this.ref, required this.token});

  static SKDB get(String word) {
    var letter = word[0].toLowerCase();
    return SKDB.values.firstWhere((element) => element._code.contains(letter));
  }
}





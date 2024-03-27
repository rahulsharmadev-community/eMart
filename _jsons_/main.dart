import 'dart:io';
import 'dart:convert' as con;

var file = File('keywords.json');

typedef JSON = Map<String, dynamic>;

void main() async {
  JSON orignal = await getFileJson();
  for (var e in orignal.entries) {
    orignal[e.key] = Map.from(e.value)..addAll({'volume': 0});
  }

  JSON f1 = {}, f2 = {}, f3 = {}, f4 = {}, f5 = {};

  for (var e in orignal.entries) {
    if (SKDB.aeimr.name.contains(e.key[0])) {
      f1.addAll({e.key: e.value});
    } else if (SKDB.bfjns.name.contains(e.key[0])) {
      f2.addAll({e.key: e.value});
    } else if (SKDB.cgkot.name.contains(e.key[0])) {
      f3.addAll({e.key: e.value});
    } else if (SKDB.dhlpu.name.contains(e.key[0])) {
      f4.addAll({e.key: e.value});
    } else {
      f5.addAll({e.key: e.value});
    }
  }
  await Directory('gen').create();
  var nff1 = await File('gen/f1.json').create();
  var nff2 = await File('gen/f2.json').create();
  var nff3 = await File('gen/f3.json').create();
  var nff4 = await File('gen/f4.json').create();
  var nff5 = await File('gen/f5.json').create();

  await Future.wait([
    nff1.writeAsString(con.jsonEncode(f1)),
    nff3.writeAsString(con.jsonEncode(f3)),
    nff2.writeAsString(con.jsonEncode(f2)),
    nff4.writeAsString(con.jsonEncode(f4)),
    nff5.writeAsString(con.jsonEncode(f5))
  ]);
}

Future<JSON> getFileJson() async {
  var temp = await file.readAsString();
  return JSON.from(con.jsonDecode(temp));
}

enum SKDB {
  aeimr,
  bfjns,
  cgkot,
  dhlpu,
  qvwxyz,
}

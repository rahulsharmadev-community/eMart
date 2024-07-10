// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:io';

void main() async {
  var importFile = File('new_after.json');
  var input = await importFile.readAsString();
  var jsonData = Map.from(jsonDecode(input));

  print(jsonData.length);

  await File('_new_after.json').writeAsString(jsonEncode(cleanMap(jsonData)));
}

Map cleanMap(Map map) {
  var result = {};
  map.forEach((key, value) {
    if (value is Map) result[key] = cleanMap(value);
    if (value is List) {
      if (value.length == 1) {
        var tmp = result['Other'] ?? [];
        result['Other'] = [...tmp, ...value];
      } else {
        result[key] = value..remove(key);
      }
    }
  });

  return result;
}
// Map union(Map a, Map b) {
//   if (a.isEmpty) return b;
//   if (b.isEmpty) return a;

//   Map result = {};

//   if (a.length > b.length) {
//     var temp = a;
//     a = b;
//     b = temp;
//   }

//   a.forEach((key, v1) {
//     if (b.containsKey(key)) {
//       var v2 = b[key];
//       if (v1 is List && v2 is List) {
//         result[key] = [...v2, ...v1];
//       } else if (v1 is Map && v2 is Map) {
//         result[key] = union(v1, v2);
//       } else if (v1 is Map && v2 is List) {
//         var fv = [...(result[key] ?? []), ...v2];

//         result[key] = fv;
//       } else if (v1 is List && v2 is Map) {
//         var old = result[key] ??
//             {
//               v1.first: [v1.first]
//             };
//         result[key] = {...old, ...v2};
//       } else {
//         result[key] = v1;
//       }
//       b.remove(key);
//     } else {
//       result[key] = v1;
//     }
//   });

//   b.forEach((key, value) {
//     if (!result.containsKey(key)) {
//       result[key] = value;
//     }
//   });

//   return result;
// }

// Map getMap(String key, Map m1, Map m2) {
//   var list1 = m1[key];
//   var list2 = m2[key];
//   if (list2 == null || list1 == null) return {};
//   return {
//     key: <dynamic>{...list2, ...list1}.toList()
//   };
// }

// {
//   "Appliances" : "Appliances",
//   "Laundry Appliances": "Laundry Appliances",
//   "Washers & Dryers": "Washers & Dryers",
//   "Clothes Dryers":"Clothes Dryers",
//   "Subcategory 4": "",
//   "Subcategory 5": "",
//   "Subcategory 6": "",
//   "Subcategory 7": "",
//   "Subcategory 8": ""
// },

// before = [1,2,3,4];
// after = {1:{2:{3:{4:null}}}};

Map transformListToMap(List list) {
  if (list.isEmpty) return {};

  var result = {}; // Start with the last element mapped to null
  for (int i = list.length - 1; i >= 0; i--) {
    if (list[i] == "") continue;
    if (result.isEmpty && i > 1) {
      result[list[i - 1]] = [list[i]];
      i--;
    } else {
      result = {list[i]: result};
    }
  }

  return result;
}

// Map<String, dynamic> mergeMaps(List maps) {
//   Map<String, dynamic> result = {};

//   for (var map in maps) {
//     map.forEach((key, value) {
//       if (result.containsKey(key)) {
//         result[key] = recursiveMerge(result[key], value);
//       } else {
//         result[key] = value;
//       }
//     });
//   }

//   return result;
// }

Map recursiveMerge(Map map1, Map map2) {
  final result = Map<String, dynamic>.from(map1);
  map2.forEach((key, value) {
    if (value is Map && map1.containsKey(key) && map1[key] is Map) {
      // Merge nested maps recursively
      result[key] = recursiveMerge(map1[key] as Map<String, dynamic>, value);
    } else if (value is List && map1.containsKey(key) && map1[key] is List) {
      // Combine list values (assuming unique elements)
      result[key] = (map1[key] as List<dynamic>)
        ..addAll(value.where((element) => !(map1[key] as List).contains(element)));
    } else {
      // Override existing values

      result[key] = result[key].union(value);
    }
  });

  return result;
}

List<Map<String, dynamic>> input = [
  {
    "key1": {"a1": {}}
  },
  {
    "key1": {
      "a1": {
        "a1--1": ["obj1"]
      },
      "a2": {
        "a2-1": [1, 2, 3]
      }
    }
  },
  {
    "key1": {
      "a1": {
        "a1-1": ["obj2"]
      },
      "a2": {
        "a2-1": [6, 7],
        "a2-2": [6, 7]
      }
    }
  }
];

var reult = {
  "key1": {
    "a1": {
      "a1-1": ["obj2", "obj2"]
    },
    "a2": {
      "a2-1": [1, 2, 3, 6, 7],
      "a2-2": [6, 7]
    }
  }
};

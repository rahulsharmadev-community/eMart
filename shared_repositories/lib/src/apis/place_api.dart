// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jars/jars_core.dart';
import 'package:shared/models.dart';

class Place {
  final String? houseNumber;
  final String? name;
  final JSON_1? state;
  final JSON_1? country;
  final int? postalCode;
  final String? city;
  final String? area;
  final String? district;
  final GeoCoordinate geoCoordinate;
  // also known as global_code
  final String plusCode;

  Place(
      {this.houseNumber,
      this.name,
      this.state,
      this.country,
      this.postalCode,
      this.city,
      this.area,
      this.district,
      required this.geoCoordinate,
      required this.plusCode});
}

final class PlaceApi {
  const PlaceApi();
  String geoapifyUrl(String token, String extra) =>
      "https://api.geoapify.com/v1/$extra&format=json&apiKey=$token";

  String googleUrl(String extra) => "https://maps.googleapis.com/maps/api/$extra&key=$GOOGLE_MAP_API_KEY";

  Future<String?> plusCode(GeoCoordinate coordinate) async {
    var url = Uri.parse("https://plus.codes/api?address=${coordinate.lat},${coordinate.lng}");
    final response = await http.get(url);
    return jsonDecode(response.body)['plus_code']?['global_code'] as String?;
  }

  Future<List<Place>?> geoapifyGeoCoordinate(GeoCoordinate code, {int limit = 10}) async {
    try {
      String url =
          geoapifyUrl(GEOAPIFY_API_KEY_1, 'geocode/reverse?lat=${code.lat}&lon=${code.lng}&limit=$limit');
      final response = await http.get(Uri.parse(url));
      var x = List<Map>.from(jsonDecode(response.body)['results']);
      return x.map((e) => _geoapifyToPlace(e)).nonNulls.toList();
    } catch (e) {
      print('===>' + e.toString());
      rethrow;
    }
  }

  Future<List<Place>?> geoapifyAutoComplete(String text, {int limit = 10}) async {
    var trim = text.trim();
    if (trim.isEmpty) return null;
    try {
      String url = geoapifyUrl(GEOAPIFY_API_KEY_1, 'geocode/autocomplete?text=$trim&limit=$limit');
      final response = await http.get(Uri.parse(url));
      var x = List<Map>.from(jsonDecode(response.body)['results']);
      return x.map((e) => _geoapifyToPlace(e)).nonNulls.toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Place>?> googleGeoCoordinate(GeoCoordinate code) async {
    try {
      String url = googleUrl('geocode/json?latlng=${code.lat},${code.lng}');
      final response = await http.get(Uri.parse(url));
      var raw = jsonDecode(response.body);
      var x = List<Map>.from(raw['results']);
      return x.map((e) => _googleToPlace(e, raw['plus_code']['global_code'].toString())).nonNulls.toList();
    } catch (e) {
      rethrow;
    }
  }

  Place? _geoapifyToPlace(json) {
    print('_geoapifyToPlace: $json');
    var state, country, loc;
    var plusCode = json['plus_code'];
    var postalCode = int.tryParse(json['postcode'] ?? '');

    if (json['state_code'] != null && json['state'] != null) {
      state = (key: json['state_code'].toUpperCase(), value: json['state']);
    }
    if (json['country_code'] != null && json['country'] != null) {
      country = (key: json['country_code'].toUpperCase(), value: json['country']);
    }
    if (json['lat'] != null && json['lon'] != null) {
      loc = (lat: (json['lat'] as num).toDouble(), lng: (json['lon'] as num).toDouble());
    }
    if ([state, country, postalCode, plusCode, loc].contains(null)) return null;

    var area = ("${json['street'] ?? ''} ${json['road'] ?? ''}").toString().trim();
    return Place(
      name: json['name'],
      houseNumber: json['housenumber'],
      district: json['district'] ?? json['state_district'],
      area: area.isNotEmpty ? area : json['suburb'],
      city: json['city'],
      country: country,
      state: state,
      plusCode: plusCode,
      geoCoordinate: loc,
      postalCode: postalCode,
    );
  }

  Place? _googleToPlace(Map json, String defaultPlusCode) {
    var components = List.from(json['address_components']);

    // Default values
    Set<String>? areaSet = {};
    var district, houseNumber, name, city, plusCode, loc;
    JSON_1? country, state;
    int? postalCode;

    for (var component in components) {
      var types = component['types'] as List<dynamic>;
      var longName = component['long_name'] as String;
      // Identifying component types and assigning values accordingly
      if (types.contains('plus_code')) {
        plusCode = longName;
      } else if (types.contains('premise')) {
        houseNumber = longName;
      } else if (types.contains('sublocality_level_2')) {
        name = longName;
      } else if (types.contains('sublocality_level_1')) {
        areaSet.add(longName);
      } else if (types.contains('locality')) {
        city = longName;
      } else if (types.contains('administrative_area_level_2')) {
        district = longName;
      } else if (types.contains('administrative_area_level_1')) {
        state = (key: component['short_name'].toString().toUpperCase(), value: longName);
      } else if (types.contains('country')) {
        country = (key: component['short_name'].toString().toUpperCase(), value: longName);
      } else if (types.contains('postal_code')) {
        postalCode = int.tryParse(longName.toString());
      }
    }

    var temp = json['geometry']?['location'];
    if (temp != null && temp['lat'] != null && temp['lng'] != null) {
      loc = (lat: (temp['lat'] as num).toDouble(), lng: (temp['lng'] as num).toDouble());
    }

    plusCode ??= json['plus_code']?['global_code'] ?? defaultPlusCode;
    var area = areaSet.isEmpty ? null : areaSet.join(', ');

    if ([state, country, postalCode, plusCode, loc].contains(null)) return null;
    return Place(
      name: name,
      houseNumber: houseNumber,
      plusCode: plusCode!,
      district: district,
      area: area,
      city: city,
      state: state,
      country: country,
      postalCode: postalCode,
      geoCoordinate: loc,
    );
  }
}

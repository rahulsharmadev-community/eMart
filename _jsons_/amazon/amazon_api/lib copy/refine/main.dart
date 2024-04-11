import 'dart:async';

import '../amazon_gen/amazon/amazon.dart';
import 'jsonfile.dart';
import 'package:shared/models.dart';
import 'package:jars_core/jars_core.dart';

const title =
    "Pro360 Nefro LP (fka Nephro LP) Non-Dialysis Care Protein Powder Low Protein, High Fat Formula Enriched with L-Taurine, L-Carnitine for Kidney/Renal Health, No Added Sugar – Vanilla Flavour 400g";

Future<void> mainRun(String args) async {
  var jf = JsonFile(args);
  var ls = await jf.loadFile();
  var json = ls.map((e) => {e.productId: e.toJson()}).reduce((value, element) => {...value, ...element});

  await jf.writeFile([json]);
}

Product cleanProduct(Product product) {
  if (product.title.length > 64) {
    product.copyWith.title(title.substring(0, 64 + title.substring(64).indexOf(RegExp(r'[,\-|\\/\(\)]'))));
  }

  if (product.title.length > 64) {
    product = product.copyWith
        .title(title.substring(0, 64 + title.substring(64).indexOf(RegExp(r'[,\-|\\/\(\)]'))).trim());
  }
  product = product.copyWith(
      shotDescription: product.shotDescription?.replaceAll('     ', '\n').replaceAll('  ', ' '),
      feature: product.feature?.where((e) => e.length < 100).map((e) {
        var ls = e.split(':');
        return '${ls[0].trim()}: ${ls[1].trim()}';
      }).toList(),
      unit: ProductUnit(
          quantity: product.unit.quantity,
          weight: calculateWeight(product.detailedSpecs).$1,
          weightMeasurement: calculateWeight(product.detailedSpecs).$2,
          dimensionMeasurement: calculateLengthMeasurement(product.detailedSpecs),
          dimension: dimension(product.detailedSpecs['Item Dimensions LxWxH'])),
      rating: product.rating.toPrecision(1),
      keywords: [
        product.detailedSpecs['Brand'],
        product.detailedSpecs['Model Name'],
        product.detailedSpecs['Processor Brand'],
        product.title
      ].nonNulls().map((e) => e.removeAllSpace.toLowerCase().replaceAll('&', '')).toList(),
      detailedSpecs: removeKeys(
        product.detailedSpecs,
        [
          'Best Sellers Rank',
          'Item Dimensions LxWxH',
          'Packer',
          'Item model number',
          'Importer',
          'Date First Available',
          'Item Weight',
          'Net Quantity',
          'Generic Name',
          'Weight'
        ],
      ));

  return product;
}

LengthMeasurement? calculateLengthMeasurement(JSON json) {
  if (json['Item Dimensions LxWxH'] == null) return null;
  var lowerCase = (json['Item Dimensions LxWxH'] as String).toLowerCase();
  if (lowerCase.endsWith('centimeters') || lowerCase.endsWith('cm')) return LengthMeasurement.cm;
  if (lowerCase.contains('foot')) return LengthMeasurement.foot;
  if (lowerCase.contains('inch')) return LengthMeasurement.inch;
  if (lowerCase.contains('km') || lowerCase.contains('kilometre')) return LengthMeasurement.km;
  if (lowerCase.endsWith('m') || lowerCase.contains('metre')) return LengthMeasurement.m;
  return null;
}

(double, WeightMeasurement) calculateWeight(JSON json) {
  var list = ((json['Net Quantity'] ?? json['Item Weight']) as String).split(' ');
  return (
    double.tryParse(list[0]) ?? 0,
    list[1].toLowerCase().startsWith('g') ? WeightMeasurement.gram : WeightMeasurement.kilogram
  );
}

Map<String, String> removeKeys(Map<String, String> json, List<String> keysToRemove) {
  Map<String, String> updatedJson = Map.from(json);
  for (var key in keysToRemove) {
    updatedJson.remove(key);
  }
  return updatedJson;
}

({double l, double w, double h})? dimension(String? dimensions) {
  if (dimensions == null) return null;
  RegExp regex = RegExp(r'(\d+(\.\d+)?)'); // Matches decimal numbers
  List<double> values = regex.allMatches(dimensions).map((match) => double.parse(match.group(0)!)).toList();
  return (l: values[0], w: values[1], h: values[2]);
}

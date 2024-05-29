import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:jars/jars.dart';
import 'table_builder.dart';

class FeaturesBuilder extends StatelessWidget {
  final List<String> feature;
  const FeaturesBuilder(this.feature, {super.key});

  @override
  Widget build(BuildContext context) {
    var titleMedium = context.textTheme.titleMedium;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('HIGHLIGHTS', style: titleMedium),
        4.gap,
        TableBuilder(
          padding: const EdgeInsets.only(left: 4),
          data: feature.map((e) => ('•', e)).toList(),
        ),
      ],
    );
  }
}

class DetailedSpecsBuilder extends StatelessWidget {
  final Map<String, String> map;
  const DetailedSpecsBuilder(this.map, {super.key});

  @override
  Widget build(BuildContext context) {
    var titleMedium = context.textTheme.titleMedium;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DETAILED SPECS', style: titleMedium),
        4.gap,
        TableBuilder(showBorder: true, data: [for (var e in map.entries) (e.key, e.value)]),
      ],
    );
  }
}

class DescriptionBuilder extends StatelessWidget {
  final String description;
  const DescriptionBuilder(this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DESCRIPTION', style: context.textTheme.titleMedium),
        4.gap,
        MarkdownBody(data: description)
      ],
    );
  }
}

class PriceBuilder extends StatelessWidget {
  final num mrp;
  final num discountedPrice;
  final num discount;
  const PriceBuilder({
    super.key,
    required this.mrp,
    required this.discountedPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    var nf = const NumberFormat.en_in();
    var mrp = nf.simple(this.mrp, currencySymbol: true, trimZero: true);
    var discount = nf.simple(this.discount);
    var discountedPrice = nf.simple(this.discountedPrice);

    var titleMedium = context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal);
    var titleLarge = context.textTheme.titleLarge;

    return SizedBox(
      height: kToolbarHeight,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Text.rich(
          TextSpan(
            text: discountedPrice,
            style: context.textTheme.headlineLarge,
            children: [
              TextSpan(text: ' M.R.P: ', style: titleMedium),
              TextSpan(text: '$mrp\n', style: titleMedium?.copyWith(decoration: TextDecoration.lineThrough)),
              const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(Icons.arrow_downward_rounded, color: Colors.green)),
              TextSpan(
                text: '$discount% OFF',
                style: titleLarge?.copyWith(color: Colors.green, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

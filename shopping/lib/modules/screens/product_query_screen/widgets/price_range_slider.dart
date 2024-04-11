import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PriceRangeSlider extends StatefulWidget {
  final double min, max;
  final void Function(PriceQuery query)? onSubmit;
  const PriceRangeSlider({super.key, required this.min, required this.max, this.onSubmit});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues _currentValues;
  @override
  void initState() {
    _currentValues = RangeValues(widget.min, widget.max);
    super.initState();
  }

  void onChanged(RangeValues values) => setState(() => _currentValues = values);

  void onSubmit() {
    if (widget.onSubmit != null) {
      widget.onSubmit!(PriceQuery(_currentValues.start.toInt(), _currentValues.end.toInt()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var slider = RangeSlider(
      values: _currentValues,
      max: 100,
      min: 0,
      divisions: 5,
      labels: RangeLabels(
        (_currentValues.start * 100).toString(),
        (_currentValues.end * 100).toString(),
      ),
      onChanged: onChanged,
    );
    return FormBuilder(
        title: 'Price Range',
        actions: [ElevatedButton(onPressed: onSubmit, child: const Text('Done'))],
        children: [slider]);
  }
}

class DiscountSlider extends StatefulWidget {
  final double inital;
  final void Function(DiscountQuery query)? onSubmit;
  const DiscountSlider({super.key, required this.inital, this.onSubmit});

  @override
  State<DiscountSlider> createState() => _DiscountSliderState();
}

class _DiscountSliderState extends State<DiscountSlider> {
  double _currentValues = 0;

  @override
  void initState() {
    _currentValues = widget.inital;
    super.initState();
  }

  void onChanged(double values) => setState(() => _currentValues = values);

  void onSubmit() {
    if (widget.onSubmit != null) {
      widget.onSubmit!(DiscountQuery(_currentValues.toInt()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        title: 'Price Range',
        actions: [ElevatedButton(onPressed: onSubmit, child: const Text('Done'))],
        children: [Slider.adaptive(value: _currentValues, onChanged: onChanged)]);
  }
}

// ignore: must_be_immutable
class RatingSlider extends StatelessWidget {
  final double inital;
  final void Function(RatingQuery query)? onSubmit;
  RatingSlider({super.key, required this.inital, this.onSubmit});

  double _currentValues = 0;

  void onChanged(double values) => _currentValues = values;

  void _onSubmit() {
    if (onSubmit != null) {
      onSubmit!(RatingQuery(_currentValues.toInt()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(title: 'Price Range', actions: [
      ElevatedButton(onPressed: _onSubmit, child: const Text('Done'))
    ], children: [
      RatingBar.builder(
          minRating: 1,
          itemCount: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          initialRating: inital,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: onChanged)
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shopping/modules/screens/product_query_builder/bloc/product_query_filter_cubit.dart';

import 'package:ico/ico.dart';
import 'package:shopping/modules/screens/product_query_builder/widgets/price_range_slider.dart';

class ProductQueryFilterBar extends StatefulWidget {
  const ProductQueryFilterBar({super.key});

  @override
  State<ProductQueryFilterBar> createState() => _ProductQueryFilterBarState();
}

class _ProductQueryFilterBarState extends State<ProductQueryFilterBar> {
  ProductQueryFilterCubit get controller => context.read<ProductQueryFilterCubit>();

  onSubmit(Query query) => controller.add([query]);

  onDeleted(Type type) => controller.removeWhereType(type);

  bool isSelected(Type type) => controller.isApplyed(type);

  CircularProgressIndicator? activeIcon(Type type) =>
      controller.isPending(type) ? const CircularProgressIndicator() : null;

  @override
  Widget build(BuildContext context) {
    final List<(String, IconData, Type, Function(bool)?)> queryData = [
      (
        'Price',
        Ico.filter_outline,
        PriceQuery,
        (p0) => showModalBottomSheet(
            context: context, builder: (_) => PriceRangeSlider(min: 0, max: 10, onSubmit: onSubmit))
      ),
      (
        'Discount',
        Icons.discount_outlined,
        DiscountQuery,
        (p0) => showModalBottomSheet(
            context: context, builder: (_) => DiscountSlider(inital: 20, onSubmit: onSubmit))
      ),
      (
        'Rating',
        Icons.star_border_rounded,
        RatingQuery,
        (p0) => showModalBottomSheet(
            context: context, builder: (_) => RatingSlider(inital: 1, onSubmit: onSubmit))
      ),
    ];
    return BlocBuilder<ProductQueryFilterCubit, QueryFilter>(
      builder: (context, state) {
        return SizedBox(
          height: kToolbarHeight,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            itemCount: queryData.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const Gap(8),
            itemBuilder: (context, i) {
              var e = queryData[i];
              return FilterChip(
                  avatar: Icon(e.$2),
                  label: Text(e.$1),
                  onDeleted: isSelected(e.$3) ? () => onDeleted(e.$3) : null,
                  deleteIcon: activeIcon(e.$3),
                  selected: isSelected(e.$3),
                  onSelected: e.$4);
            },
          ),
        );
      },
    );
  }
}

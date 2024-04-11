import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/screens/product_query_screen/bloc/product_query_controller.dart';
import 'package:shopping/modules/screens/product_query_screen/bloc/product_query_cubit.dart';
import 'package:shopping/modules/screens/product_query_screen/widgets/price_range_slider.dart';
import 'package:ico/ico.dart';

class ProductQueryScreen extends StatelessWidget {
  final Set<Query> initalQuery;
  const ProductQueryScreen(this.initalQuery, {super.key});

  @override
  Widget build(BuildContext context) {
    print(initalQuery.map((e) => e.runtimeType));
    var bloc = ProductQueryBloc(context.read<ProductRepository>())..fetch(initalQuery);
    return BlocProvider.value(
      value: bloc,
      child: RepositoryProvider(
        create: (context) => ProductQueryFilterController(),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return const Column(
      children: [
        ProductQueryFilterBar(),
        // Expanded(child: ProductQueryFilterBuilder()),
      ],
    );
  }
}

class ProductQueryFilterBuilder extends StatelessWidget {
  const ProductQueryFilterBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProductQueryFilterBar extends StatefulWidget {
  const ProductQueryFilterBar({super.key});

  @override
  State<ProductQueryFilterBar> createState() => _ProductQueryFilterBarState();
}

class _ProductQueryFilterBarState extends State<ProductQueryFilterBar> {
  ProductQueryFilterController get controller => context.read<ProductQueryFilterController>();

  onSubmit(Query query) => setState(() => controller.add(query));

  onDeleted(Type type) => setState(() => controller.removeWhereType(type));

  bool isSelected(Type type) => controller.filters.any((e) => e.runtimeType == type);

  @override
  Widget build(BuildContext context) {
    var children = [
      FilterChip(
        avatar: const Icon(Ico.filter_outline),
        label: const Text('Price'),
        onDeleted: isSelected(PriceQuery) ? () => onDeleted(PriceQuery) : null,
        selected: isSelected(PriceQuery),
        onSelected: (_) => showModalBottomSheet(
            context: context, builder: (_) => PriceRangeSlider(min: 0, max: 10, onSubmit: onSubmit)),
      ),
      FilterChip(
        label: const Text('Discount'),
        avatar: const Icon(Icons.discount_outlined),
        selected: isSelected(DiscountQuery),
        onDeleted: isSelected(DiscountQuery) ? () => onDeleted(DiscountQuery) : null,
        onSelected: (_) => showModalBottomSheet(
            context: context, builder: (_) => DiscountSlider(inital: 20, onSubmit: onSubmit)),
      ),
      FilterChip(
        label: const Text('Rating'),
        selected: isSelected(RatingQuery),
        avatar: const Icon(Icons.star_border_rounded),
        onDeleted: isSelected(RatingQuery) ? () => onDeleted(RatingQuery) : null,
        onSelected: (_) => showModalBottomSheet(
            context: context, builder: (_) => RatingSlider(inital: 1, onSubmit: onSubmit)),
      ),
    ];
    return SizedBox(
      height: kToolbarHeight,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        itemCount: children.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => children[i],
        separatorBuilder: (context, index) => const Gap(8),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart' show Product;
import 'package:shopping/modules/screens/product_query_screen/bloc/product_query_filter_cubit.dart';
import 'package:shopping/modules/screens/product_query_screen/bloc/product_query_cubit.dart';
import 'package:shopping/modules/screens/product_query_screen/widgets/price_range_slider.dart';
import 'package:ico/ico.dart';
import 'package:shopping/modules/widgets/cards/item_card.dart';
import 'package:shopping/modules/widgets/product_cards/product_card.dart';
import 'package:shopping/utility/utility.dart';

class ProductQueryScreen extends StatelessWidget {
  final Set<Query> initalQuery;
  const ProductQueryScreen(this.initalQuery, {super.key});

  @override
  Widget build(BuildContext context) {
    var productsCubit = ProductsCubit();
    var controller = ProductQueryFilterCubit(
      context.read<ProductRepository>(),
      productsCubit,
      inital: initalQuery,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: controller),
        BlocProvider.value(value: productsCubit),
      ],
      child: buildBody(),
    );
  }

  Widget buildBody() {
    return const Column(
      children: [
        ProductQueryFilterBar(),
        Expanded(child: ProductQueryFilterBuilder()),
      ],
    );
  }
}

class ProductQueryFilterBuilder extends StatelessWidget {
  const ProductQueryFilterBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, BlocState<List<Product>>>(
      builder: (context, state) {
        switch (state) {
          case BlocStateSuccess _:
            var data2 = ((state as BlocStateSuccess).data as List<Product>);
            return buildProductList(data2);
          case BlocStateLoading _:
            return const Center(child: CircularProgressIndicator());
          default:
            return const Center(child: Text('Error'));
        }
      },
    );
  }

  ListView buildProductList(List<Product> data2) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: (data2.length / 2).round(),
        itemBuilder: (context, i) {
          i = i * 2;
          var j = i + 1;
          return Row(
            children: [
              if (i < data2.length)
                Expanded(child: RegularProductCard(type: ItemCardType.vertical, product: data2[i])),
              if (j < data2.length)
                Expanded(child: RegularProductCard(type: ItemCardType.vertical, product: data2[j]))
            ],
          );
        });
  }
}

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

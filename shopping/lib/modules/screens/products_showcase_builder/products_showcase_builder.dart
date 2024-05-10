import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/widgets/cards/item_card.dart';
import 'package:shopping/modules/widgets/implicit_grid_card.dart';
import 'package:shopping/modules/widgets/product_cards/product_card.dart';
import 'package:shopping/modules/widgets/shufflebox.dart';
import 'package:shopping/utility/routes/app_routes.dart';

enum ShowCaseType { gridView, horizontalView, verticalView }

class ProductsShowcaseBuilder extends StatelessWidget {
  final Set<Query> queries;
  final ShowCaseType? type;
  final String? title;
  const ProductsShowcaseBuilder({super.key, this.type, required this.queries, this.title});

  @override
  Widget build(BuildContext context) {
    ShowCaseType type = this.type ?? ShowCaseType.values.getRandom()!;
    var repos = context.read<ProductRepository>();

    Widget buildView(List<Product> data) {
      switch (type) {
        case ShowCaseType.verticalView:
          return _buildVerticalView(data);
        case ShowCaseType.horizontalView:
          return _buildHorizontalView(data);
        default:
          var take = data.take(4).toList();
          return _buildGridView(take, context);
      }
    }

    return FutureBuilder<List<Product>>(
        future: Future.value(repos.getByQuery(queries)),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final data = snapshot.data!;
            if (title == null) return buildView(data);
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title!,
                style: context.textTheme.titleMedium,
              ).paddingOnly(left: 16),
              8.gap,
              buildView(data)
            ]);
          }
          return const Offstage();
        });
  }

  Widget _buildHorizontalView(List<Product> data) {
    return SizedBox(
      height: 18.h,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FittedBox(
            child: Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: RegularProductCard(
                type: ItemCardType.horizontal,
                product: data[index],
                hideActions: true,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVerticalView(List<Product> data) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return FittedBox(
              child: SizedBox(
            width: 150,
            child: RegularProductCard(
              type: ItemCardType.vertical,
              product: data[index],
              hideActions: true,
            ),
          ));
        },
      ),
    );
  }

  Widget _buildGridView(List<Product> data, BuildContext context) {
    return ShuffleBox(
      width: 100.w,
      crossAxisCount: 2,
      controller: ShuffleBoxController(autoShuffleDuration: 1.minutes),
      children: data.map((e) {
        return ImplicitGridCard(
            width: 100.w / 2,
            label: e.title,
            imageUrl: e.thumbnail,
            margin: EdgeInsets.zero,
            onTap: () {
              AppRoutes.ProductScreen.pushNamed(extra: e.productId);
              context.read<PrimaryUserBloc>().add(AddVisitedProductEvent(e.productId));
            });
      }).toList(),
    );
  }
}

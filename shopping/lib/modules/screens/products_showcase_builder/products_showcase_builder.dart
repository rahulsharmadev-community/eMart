import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/core/repository.dart';
import 'package:shopping/modules/widgets/cards/item_card.dart';
import 'package:shopping/modules/widgets/implicit_grid_card.dart';
import 'package:shopping/modules/widgets/product_cards/product_card.dart';
import 'package:shopping/modules/widgets/shufflebox.dart';
import 'package:shopping/utility/routes/routes_initialise.dart';

enum ShowCaseType { gridView, horizontalView, verticalView }

class ProductsShowcaseBuilder extends StatelessWidget {
  final Set<Query> queries;
  final ShowCaseType? type;
  final String? title;
  const ProductsShowcaseBuilder({super.key, this.type, required this.queries, this.title});

  @override
  Widget build(BuildContext context) {
    ShowCaseType type = this.type ?? ShowCaseType.values.getRandom()!;

    Widget buildView(List<Product> data) {
      switch (type) {
        case ShowCaseType.verticalView:
          return _buildVerticalView(data);
        case ShowCaseType.horizontalView:
          return _buildHorizontalView(context, data);
        default:
          var take = data.take(4).toList();
          return _buildGridView(take, context);
      }
    }

    return FutureBuilder<List<Product>>(
        future: repository.product.getByQuery(queries),
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

  Widget _buildHorizontalView(BuildContext context, List<Product> data) {
    return SizedBox(
      height: context.heightOf(18),
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FittedBox(
            child: Container(
              width: context.widthOf(100),
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
    var width = context.width;
    return ShuffleBox(
      width: width,
      crossAxisCount: 2,
      controller: ShuffleBoxController(autoShuffleDuration: 1.minutes),
      children: data.map((e) {
        return ImplicitGridCard(
            width: width / 2,
            label: e.title,
            imageUrl: e.thumbnail,
            margin: EdgeInsets.zero,
            onTap: () {
              context.pushNamed(AppRoutes.ProductRoute.name, extra: e.productId);
              context.read<PrimaryUserBloc>().add(AddVisitedProductEvent(e.productId));
            });
      }).toList(),
    );
  }
}

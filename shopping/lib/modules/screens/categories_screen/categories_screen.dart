import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/core/blocs/app_meta_data.dart';
import 'package:shopping/modules/screens/categories_screen/cubit/categories_cubit.dart';
import 'package:shopping/modules/widgets/implicit_grid_card.dart';
import 'package:shopping/utility/routes/app_routes.dart';

class CategoriesScreen extends StatelessWidget {
  final String? category;
  const CategoriesScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    var data = context.read<AppMetaDataBloc>().appMetaData;
    var categories =
        category.ifNotNull(def: data?.publicCategories ?? [], callback: (_) => data?.getCategoriesByTitle(_));
    var repo = context.read<CategoriesRepository>();

    return BlocProvider(
        create: (context) => CategoriesCubit(categoriesRepository: repo)..fetchData(categories),
        child: BlocBuilder<CategoriesCubit, BlocState>(builder: (context, state) {
          switch (state) {
            case BlocStateFailure _:
              return Text(state.message);
            case BlocStateSuccess<List<Category>> _:
              return ListView(
                shrinkWrap: true,
                children: [
                  buildCategoriesLeaderboard(state.data),
                  8.gap,
                  buildCategoriesWidget(state.data),
                  const Divider(),
                  buildCategoriesBanners(state.data),
                ],
              );
            default:
              return const LinearProgressIndicator();
          }
        }));
  }

  Widget buildCategoriesWidget(List<Category> categories) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.spaceEvenly,
      children: categories
          .where((e) => e.iconImg != null)
          .map((e) => ImplicitGridCard(
                width: 90,
                imageUrl: e.iconImg!,
                label: e.title,
                maxLines: 3,
                margin: EdgeInsets.zero,
                onTap: () => AppRoutes.ProductQueryScreen.goNamed(extra: CategoriesQuery([e.title])),
              ))
          .toList(),
    );
  }

  Widget buildCategoriesBanners(List<Category> categories) {
    return SizedBox(
      height: 200,
      width: 100.w,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          itemBuilder: (ctx, i) {
            return CachedNetworkImage(
              imageUrl: categories[i].bannerImg!,
              fit: BoxFit.cover,
              width: 100.w,
            );
          }),
    );
  }

  Widget buildCategoriesLeaderboard(List<Category> categories) {
    return SizedBox(
      height: kToolbarHeight,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          itemBuilder: (ctx, i) {
            return CachedNetworkImage(
              imageUrl: categories[i].leaderboardImg!,
              fit: BoxFit.cover,
              width: 100.w,
            );
          }),
    );
  }
}

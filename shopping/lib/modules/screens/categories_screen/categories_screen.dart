import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/screens/categories_screen/cubit/categories_cubit.dart';
import 'package:shopping/modules/widgets/implicit_grid_card.dart';
import 'package:shopping/utility/bloc_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesCubit(
            categoriesRepository: context.read<CategoriesRepository>(),
            metaDataRepository: context.read<AppMetaDataRepository>())
          ..fetchData(),
        child: Builder(builder: (context) {
          return BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) => buildWidget(state.categories, state.categoriesMetaData),
          );
        }));
  }

  Widget buildCategoriesWidget(BlocState categories) {
    switch (categories) {
      case BlocStateFailure _:
        return Text(categories.message);
      case BlocStateSuccess<List<Category>> _:
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: categories.data.where((e) => e.iconImg != null).map((e) {
            return ImplicitGridCard(
              width: 90,
              imageUrl: e.iconImg!,
              label: e.title,
              maxLines: 3,
              margin: EdgeInsets.zero,
            );
          }).toList(),
        );
      default:
        return const CircularProgressIndicator();
    }
  }

  Widget buildWidget(BlocState categories, BlocState categoriesMetaData) {
    return ListView(
      shrinkWrap: true,
      children: [
        buildCategoriesWidget(categories),
        const Divider(),
        // buildCategoriesBanners(categoriesMetaData),
      ],
    );
  }

  // Widget buildCategoriesBanners(BlocState categories, BlocState metadata) {
  //   switch (metadata) {
  //     case BlocErrorState _:
  //       return Text(metadata.errorMsg);
  //     case BlocSuccessState<List<Categories>> _:
  //       return ListView.builder(
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           itemCount: metadata.data.length,
  //           itemBuilder: (ctx, i) {
  //             var ls = metadata.data[i]
  //                 .categories
  //                 .map((e) => categories.firstWhereOrNull((element) => element.id == e))
  //                 .nonNulls()
  //                 .toList();

  //             return SizedBox(
  //               height: 300,
  //               child: ListView(
  //                   scrollDirection: Axis.horizontal,
  //                   children: ls.map((e) {
  //                     return AspectRatio(
  //                       aspectRatio: 16 / 9,
  //                       child: CachedNetworkImage(
  //                         imageUrl: e.bannerImg!,
  //                       ),
  //                     );
  //                   }).toList()),
  //             );
  //           });
  //     default:
  //       return const CircularProgressIndicator();
  //   }
  // }
}

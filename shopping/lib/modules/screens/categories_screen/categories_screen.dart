import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/core/blocs/app_meta_data.dart';
import 'package:shopping/modules/screens/categories_screen/cubit/categories_cubit.dart';
import 'package:shopping/modules/widgets/implicit_grid_card.dart';
import 'package:shopping/utility/bloc_state.dart';

class CategoriesScreen extends StatelessWidget {
  final String? category;
  const CategoriesScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    var all = ((context.read<AppMetaDataBloc>().state as BlocStateSuccess).data as AppMetaData).categories;
    List<String>? categories = ifNotNull(category, (_) => all.firstWhere((e) => e.title == _))?.categories;

    categories = categories ?? [for (var n in all) ...n.categories];

    var repo = context.read<CategoriesRepository>();

    return BlocProvider(create: (context) {
      return CategoriesCubit(categoriesRepository: repo)..fetchData(categories);
    }, child: Builder(builder: (context) {
      return BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) => Material(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    buildCategoriesWidget(state.categories),
                    const Divider(),
                    // buildCategoriesBanners(categoriesMetaData),
                  ],
                ),
              ));
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

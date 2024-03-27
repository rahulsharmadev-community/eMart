// ignore_for_file: must_call_super
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/core/blocs/bloc/categories_cubit.dart';
import 'package:shopping/utility/utility.dart';
import 'components/_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  List<BottomNavigationBarItem> get items => const [
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Home')
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(hintText: 'Serach Product..', prefixIcon: Icon(Icons.search)),
            readOnly: true,
            onTap: () => AppRoutes.SearchKeywordScreen.goNamed(),
          ),
          actions: [
            IconBtnWithCounter(svgSrc: "assets/icons/Cart Icon.svg", press: () => {}),
            IconBtnWithCounter(svgSrc: "assets/icons/Bell.svg", numOfitem: 3, press: () {})
          ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: items,
        onTap: (value) {},
      ),
      body: PageView(
        children: [
          Placeholder(),
          OrignalPlaceHolder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
    );
  }
}

class OrignalPlaceHolder extends StatelessWidget {
  const OrignalPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesBloc(context.read<AppMetaDataRepository>()),
        child: ListView(
          children: const [HorizontalCategoriesBar()],
        ));
  }
}

class HorizontalCategoriesBar extends StatelessWidget {
  const HorizontalCategoriesBar({super.key});

  Widget bodyBuilder(List<Categories> list) {
    const edgeInsets = EdgeInsets.symmetric(horizontal: 4);
    return SizedBox(
      height: 82,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        padding: edgeInsets,
        itemBuilder: (ctx, i) {
          return Container(
            width: 60,
            padding: edgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: list[i].subcategory.getRandom()!.iconImg,
                  width: 60,
                  height: 60,
                ),
                Text(list[i].label, textAlign: TextAlign.center, maxLines: 2).fontSize(8)
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => CategoriesBloc(context.read<AppMetaDataRepository>()),
      child: Builder(
          builder: (context) => BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  switch (state) {
                    case CategoriesError _:
                      return Text(state.errorMsg);
                    case CategoriesLoaded _:
                      return bodyBuilder(state.categories);
                    default:
                      return const LinearProgressIndicator();
                  }
                },
              )),
    );
  }
}

// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/screens/home_screen/bloc/categories_cubit.dart';
import 'package:shopping/modules/widgets/implicit_grid_card.dart';
import 'package:shopping/utility/bloc_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesBloc(context.read<AppMetaDataRepository>()),
        child: Material(
          child: ListView(
            children: const [
              HorizontalCategoriesBar(
                widthOfItem: 80,
                height: 120,
              )
            ],
          ),
        ));
  }
}

class HorizontalCategoriesBar extends StatelessWidget {
  final double widthOfItem, height;
  const HorizontalCategoriesBar({super.key, required this.widthOfItem, required this.height});

  Widget bodyBuilder(List<Categories> list) {
    const edgeInsets = EdgeInsets.symmetric(horizontal: 4);
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        padding: edgeInsets,
        itemBuilder: (ctx, i) {
          return ImplicitGridCard(
            label: list[i].title,
            imageUrl: list[i].iconImg,
            width: widthOfItem,
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
          builder: (context) => BlocBuilder<CategoriesBloc, BlocState>(
                builder: (context, state) {
                  switch (state) {
                    case BlocStateFailure _:
                      return Text(state.message);
                    case BlocStateSuccess _:
                      return bodyBuilder(state.data);
                    default:
                      return const LinearProgressIndicator();
                  }
                },
              )),
    );
  }
}

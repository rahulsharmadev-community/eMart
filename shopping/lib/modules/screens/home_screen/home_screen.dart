// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:jars/utility.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/core/blocs/bloc/categories_cubit.dart';
import 'package:shopping/modules/screens/dashboard/mobile/mobile_dashboard.dart';
import 'package:shopping/modules/screens/dashboard/web/web_dashboard.dart';
import 'package:shopping/utility/utility.dart';
import 'components/_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesBloc(context.read<AppMetaDataRepository>()),
        child: const Center(
          child: Text('HomeScreen'),
        ));
  }
}

// class HorizontalCategoriesBar extends StatelessWidget {
//   const HorizontalCategoriesBar({super.key});

//   Widget bodyBuilder(List<Categories> list) {
//     const edgeInsets = EdgeInsets.symmetric(horizontal: 4);
//     return SizedBox(
//       height: 82,
//       child: ListView.builder(
//         itemCount: list.length,
//         scrollDirection: Axis.horizontal,
//         padding: edgeInsets,
//         itemBuilder: (ctx, i) {
//           return ImplicitGridCard(
//             label: list[i].label,
//             imageUrl: list[i].subcategory.getRandom()!.iconImg,
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       lazy: false,
//       create: (context) => CategoriesBloc(context.read<AppMetaDataRepository>()),
//       child: Builder(
//           builder: (context) => BlocBuilder<CategoriesBloc, CategoriesState>(
//                 builder: (context, state) {
//                   switch (state) {
//                     case CategoriesError _:
//                       return Text(state.errorMsg);
//                     case CategoriesLoaded _:
//                       return bodyBuilder(state.categories);
//                     default:
//                       return const LinearProgressIndicator();
//                   }
//                 },
//               )),
//     );
//   }
// }
// }

// ignore_for_file: must_call_super
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:shopping/utility/extensions.dart';
import 'package:shopping/utility/utility.dart';
import 'components/_components.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});
  // List<BottomNavigationBarItem> get items => const [
  //       BottomNavigationBarItem(icon: Icon(Icons.store)),
  //       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
  //       BottomNavigationBarItem(icon: Icon(Icons.person)),
  //       BottomNavigationBarItem(icon: Icon(Icons.menu))
  //     ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: TextField(
              decoration: const InputDecoration(hintText: 'Serach Product..', prefixIcon: Icon(Icons.search)),
              readOnly: true,
              onTap: () =>AppRoutes.ProductSearchScreen.push(),
            ),
            actions: [
              IconBtnWithCounter(svgSrc: "assets/icons/Cart Icon.svg", press: () => {}),
              IconBtnWithCounter(svgSrc: "assets/icons/Bell.svg", numOfitem: 3, press: () {})
            ]),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: items,
        //   onTap: (value) {},
        // ),
        body: RefreshIndicator(
          onRefresh: () async {
            Future.delayed(2.seconds, () => JSnackbarConfig.loading());
          },
          child: Text(context.primaryUser.toJson().toString()),
        ));
  }
}

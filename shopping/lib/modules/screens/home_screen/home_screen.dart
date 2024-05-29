// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/core/blocs/app_meta_data.dart';
import 'package:shopping/modules/screens/products_showcase_builder/products_showcase_builder.dart';
import 'package:shopping/modules/widgets/alert_banner/alert_banner.dart';
import 'package:shopping/modules/widgets/implicit_grid_card.dart';
import 'package:shopping/modules/widgets/live_countdown_banner/live_countdown_banner.dart';
import 'package:shopping/utility/extensions.dart';
import 'package:shopping/utility/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppMetaData? appMetaData = context.read<AppMetaDataBloc>().appMetaData;

    var suggestionKeywords2 = context.primaryUser.userActivity.suggestionKeywords;
    var visitedProducts = context.primaryUser.userActivity.visitedProducts;

    var items = <Widget>[
      if (appMetaData != null) ...buildStickyAlertBanners(appMetaData),
      const HorizontalCategoriesBar(widthOfItem: 80, height: 120),
      ...[
        ProductsShowcaseBuilder(
          title: 'Deal related to your Views',
          queries: {KeywordQuery(suggestionKeywords2)},
        ),
        ProductsShowcaseBuilder(
          title: 'Recently Viewed',
          queries: {ProductIdsQuery(visitedProducts)},
        ),
        const ProductsShowcaseBuilder(
          title: '4+ Star Deals',
          queries: {RatingQuery(4)},
        ),
      ]..shuffle()
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, i) => items[i],
      separatorBuilder: (context, i) => i < 2 ? 0.gap : const Gap(12),
    );
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
          itemBuilder: (ctx, i) => ImplicitGridCard(
            maxLines: 1,
            label: list[i].title,
            imageUrl: list[i].iconImg,
            width: widthOfItem,
            onTap: () => AppRoutes.CategoriesScreen.goNamed(queryParameters: {'search': list[i].title}),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => BlocBuilder<AppMetaDataBloc, BlocState>(builder: (context, state) {
              return state.on(
                  onInitial: const LinearProgressIndicator(),
                  onFailure: (state) => Text(state.message),
                  onSuccess: (state) => bodyBuilder((state.data as AppMetaData).categories));
            }));
  }
}

List<Widget> buildStickyAlertBanners(AppMetaData data) {
  return [
    if (data.gloabalAlertBanner != null)
      AlertBanner(
        content: data.gloabalAlertBanner!.content,
        expiry: data.gloabalAlertBanner!.expiry,
        decoration: data.gloabalAlertBanner!.decoration,
        border: data.gloabalAlertBanner!.border,
        backgroundColor: data.gloabalAlertBanner!.backgroundColor,
        showCloseButton: data.gloabalAlertBanner!.showCloseButton,
        prefixIcon: data.gloabalAlertBanner!.prefixIcon,
        onAction: (p0) {},
        onClose: () {},
      ),
    if (data.localAlertBanner?.homeScreen != null)
      AlertBanner(
        content: data.localAlertBanner!.homeScreen!.content,
        expiry: data.localAlertBanner!.homeScreen!.expiry,
        decoration: data.localAlertBanner!.homeScreen!.decoration,
        border: data.localAlertBanner!.homeScreen!.border,
        backgroundColor: data.localAlertBanner!.homeScreen!.backgroundColor,
        showCloseButton: data.localAlertBanner!.homeScreen!.showCloseButton,
        prefixIcon: data.localAlertBanner!.homeScreen!.prefixIcon,
      ),
    if (data.liveCountdownBanner != null && !data.liveCountdownBanner!.isExpired)
      LiveCountdownBanner(
        height: data.liveCountdownBanner!.height,
        target: data.liveCountdownBanner!.target,
        imageUrl: data.liveCountdownBanner!.imageUrl,
        returnOnDone: data.liveCountdownBanner!.returnOnDone,
        onDone: (p0) {},
        backgroundColor: data.liveCountdownBanner!.backgroundColor,
      ),
  ];
}

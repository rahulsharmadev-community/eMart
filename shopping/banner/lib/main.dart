import 'dart:ui';

import 'package:banner/cards/badge_icon.dart';
import 'package:banner/cards/item_card.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppRun());
}

class AppRun extends StatelessWidget {
  const AppRun({super.key});

  @override
  Widget build(BuildContext context) {
    var image = Image.network(
      "https://m.media-amazon.com/images/I/71QuxMtR58L._SX679_.jpg",
      fit: BoxFit.cover,
    );
    const column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tata Tea Gold Care, Goodness of Cardamom, Ginger, Tutsi, Brahmi & Mulethi Natural In redients',
          overflow: TextOverflow.clip,
          maxLines: 3,
        ),
        Row(
          children: [
            Text('₹3,450', style: TextStyle(fontSize: 18)),
            Gap(4),
            Text('M.R.P: ', style: TextStyle(fontSize: 13, color: Colors.black54)),
            Text('₹4,050',
                style:
                    TextStyle(decoration: TextDecoration.lineThrough, fontSize: 13, color: Colors.black54)),
          ],
        ),
        Text.rich(
          TextSpan(text: 'FREE delivery', style: TextStyle(fontSize: 12), children: [
            TextSpan(text: ' Tomorrow, 13 Apr', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
          ]),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse}),
      theme: ThemeData(),
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ItemCard(
                  ItemCardType.horizontal,
                  height: 200,
                  leading: image,
                  content: column,
                  bannerMsg: 'BEST DEAL',
                  labelAlignment: MainAxisAlignment.start,
                  labels: [const Text('◈ Sponsored').fontSize(3244)],
                  actionsPadding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                  actions: [Expanded(child: ElevatedButton(onPressed: () {}, child: const Text('Buy')))],
                ),
                ItemCard(
                  ItemCardType.vertical,
                  width: 600,
                  height: 800,
                  leading: image,
                  content: column,
                  bannerMsg: 'BEST DEAL',
                  labels: [const Text('◈ Sponsored').fontSize(12)],
                  labelAlignment: MainAxisAlignment.center,
                  actionsPadding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                  actionsAlignment: MainAxisAlignment.start,
                  actions: [ElevatedButton(onPressed: () {}, child: const Text('Buy')).tightFit()],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ItemCard(
                        ItemCardType.vertical,
                        leading: image,
                        content: column,
                        bannerMsg: 'BEST DEAL',
                        labels: [const Text('◈ Sponsored').fontSize(12)],
                        labelAlignment: MainAxisAlignment.center,
                        actionsPadding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                        actionsAlignment: MainAxisAlignment.start,
                        actions: [ElevatedButton(onPressed: () {}, child: const Text('Buy')).tightFit()],
                      ),
                    ),
                    Expanded(
                      child: ItemCard(
                        ItemCardType.vertical,
                        leading: image,
                        content: column,
                        bannerLocation: BannerLocation.topEnd,
                        badge: const BadgeIcon(text: '20%\nOFF'),
                        bannerMsg: 'BEST DEAL',
                        labels: [const Text('◈ Sponsored').fontSize(12)],
                        actionsPadding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                        actionsAlignment: MainAxisAlignment.start,
                        actions: [ElevatedButton(onPressed: () {}, child: const Text('Buy'))],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

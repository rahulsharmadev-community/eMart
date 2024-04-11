import 'dart:convert';
import 'dart:ui';

import 'package:banner/widgets/alert_banner/alert_banner.dart';
import 'package:banner/widgets/alert_banner/alert_model.dart';
import 'package:banner/widgets/shufflebox.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppRun());
}

var model = AlertModel(
    content: AlertContent(
        // isMarquee: true,
        buttons: [
          AlertButton(
              imageUrl:
                  'https://static.vecteezy.com/system/resources/previews/002/282/919/large_2x/abstract-fluid-gradient-background-free-vector.jpg'),
          AlertButton(
              text: 'Image Button',
              imageUrl:
                  'https://static.vecteezy.com/system/resources/previews/002/282/919/large_2x/abstract-fluid-gradient-background-free-vector.jpg'),
          AlertButton(text: 'Cancel'),
          AlertButton(text: 'Cancel', isOutlineButton: true),
        ],
        text:
            '''This livestream was supposed to take place on my other channel Watch Roz VLOGS This livestream was supposed to take place on my other channel Watch Roz VLOGS''',
        // imageUrl:
        //     'https://static.vecteezy.com/system/resources/previews/002/282/919/large_2x/abstract-fluid-gradient-background-free-vector.jpg',
        textColor: Colors.amberAccent),
    expiry: DateTime.now());

var model2 = AlertModel(
    decoration: true,
    content: AlertContent(
      // isMarquee: true,
      text: '''This Gloabal banner was supposed to take place on my other channel''',
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/002/282/919/large_2x/abstract-fluid-gradient-background-free-vector.jpg',
      textColor: Colors.amberAccent,
    ),
    prefixIcon: IconModel(codePoint: 59083),
    expiry: DateTime.now());

class AppRun extends StatelessWidget {
  const AppRun({super.key});

  @override
  Widget build(BuildContext context) {
    ShuffleBoxController controller = ShuffleBoxController();
    // print(jsonEncode(model2.toJson()));


    print(jsonEncode(model.toJson()));
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse}),
      theme: ThemeData(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AlertBanner(model: model),
            AlertBanner(model: model2),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: controller.shuffle,
                  child: const Text("Shuffle"),
                ),
                ElevatedButton(
                  onPressed: controller.shuffle,
                  child: const Text("Shuffle"),
                ),
              ],
            ),
            LayoutBuilder(
              builder: (d, w) => ShuffleBox(
                width: w.maxWidth,
                crossAxisCount: 6,
                controller: controller,
                children: List.generate(18, (i) {
                  return Container(color: Colors.orange, child: Center(child: Text('${i + 1}')));
                }),
              ),
            ),
            const Text('Material App Bar'),
          ]),
        ),
      ),
    );
  }
}

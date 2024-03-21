import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String title;
  final List<String> urls;
  final VoidCallback? onDone;
  final VoidCallback? onBack;
  ImagePreviewScreen({
    super.key,
    this.title = 'Preview',
    required this.urls,
    this.onBack,
    this.onDone,
  }) : assert(urls.isEmpty, 'Any one is required.');

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async {
        if (onBack != null) {
          onBack!();
        } else {
          context.pop();
        }
      },
      child: DefaultTabController(
        length: urls.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              actions: [if (onDone != null) OutlinedButton(onPressed: onDone, child: const Text('Done'))],
            ),
            body: TabBarView(
                children: urls.map((e) => CachedNetworkImage(imageUrl: e, fit: BoxFit.fitWidth)).toList())),
      ),
    );
  }
}

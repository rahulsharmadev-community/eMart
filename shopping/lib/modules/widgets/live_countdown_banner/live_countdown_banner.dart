import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class LiveCountdownBanner extends StatefulWidget {
  final double height;
  final DateTime target;
  final String? imageUrl;
  final Color? backgroundColor;
  final String? returnOnDone;
  final void Function(String?)? onDone;
  const LiveCountdownBanner(
      {super.key,
      this.onDone,
      double? height,
      required this.target,
      this.imageUrl,
      this.backgroundColor,
      this.returnOnDone})
      : height = height ?? kToolbarHeight;

  @override
  State<LiveCountdownBanner> createState() => LiveCountdownBannerState();
}

class LiveCountdownBannerState extends State<LiveCountdownBanner> {
  int dd = 0, hh = 0, mm = 0, ss = 0;
  StreamController<Duration>? controller;
  Timer? timer;

  DateTime get now => DateTime.now();
  Duration get difference => widget.target.difference(now);
  bool get hasTimeLeft => difference > Duration.zero;
  @override
  void initState() {
    if (hasTimeLeft) {
      controller = StreamController<Duration>();
      timer = Timer.periodic(1.seconds, (_) {
        controller?.sink.add(difference);
        if (difference <= Duration.zero) {
          if (widget.onDone != null) widget.onDone!(widget.returnOnDone);
          timer?.cancel();
          controller?.close();
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        color: widget.backgroundColor,
        image: widget.imageUrl.ifNotNull(
            def: null,
            callback: (url) {
              return DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(url));
            }));
    return Container(
      height: widget.height,
      decoration: boxDecoration,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: !hasTimeLeft ? text() : buildCountdown(),
    );
  }

  StreamBuilder<Duration> buildCountdown() {
    return StreamBuilder(
      stream: controller!.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          setValue(snapshot.data!);
          return countdownText();
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Text countdownText() {
    final List<String> parts = [];
    if (dd != 0) parts.add(dd.toString().padLeft(2, '0'));
    if (hh != 0) parts.add(hh.toString().padLeft(2, '0'));
    if (mm != 0) parts.add(mm.toString().padLeft(2, '0'));
    if (ss != 0) parts.add(ss.toString().padLeft(2, '0'));

    final String time = parts.join(' : ');

    return text(time);
  }

  Text text([String? time]) => Text(
        time.ifNotNull(def: 'Live Countdown End', callback: (_) => _),
        style: context.textTheme.headlineMedium,
      );

  void setValue(Duration duration) {
    dd = duration.inDays;
    hh = duration.inHours % 24;
    mm = duration.inMinutes % 60;
    ss = duration.inSeconds % 60;
  }
}

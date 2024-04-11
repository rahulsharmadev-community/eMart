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
  late StreamController<Duration> controller;
  late Timer timer;
  @override
  void initState() {
    controller = StreamController<Duration>();

    timer = Timer.periodic(1.seconds, (_) {
      var difference = widget.target.difference(DateTime.now());
      controller.sink.add(difference);
      if (difference == Duration.zero) {
        if (widget.onDone != null) widget.onDone!(widget.returnOnDone);
        timer.cancel();
        controller.close();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        color: widget.backgroundColor,
        image: ifNotNull(widget.imageUrl,
            (url) => DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(url))));
    return Container(
      height: widget.height,
      decoration: boxDecoration,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            setValue(snapshot.data!);
            return buildCountdown();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Text buildCountdown() {
    String time = '';
    if (dd != 0) time += ' : ${'$dd'.padLeft(2, '0')}';
    if (hh != 0) time += ' : ${'$hh'.padLeft(2, '0')}';
    if (mm != 0) time += ' : ${'$mm'.padLeft(2, '0')}';
    if (ss != 0) time += ' : ${'$ss'.padLeft(2, '0')}';

    return Text(
      time != '' ? time.substring(3) : 'Live Countdown End',
      style: context.textTheme.headlineMedium,
    );
  }

  void setValue(Duration duration) {
    dd = duration.inDays;
    hh = duration.inHours % 24;
    mm = duration.inMinutes % 60;
    ss = duration.inSeconds % 60;
  }
}

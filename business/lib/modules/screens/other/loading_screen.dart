import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends LoadingWidget {
  final bool materialAppWraper;
  final bool canPop;
  const LoadingScreen({
    super.key,
    super.linear,
    super.value,
    super.valueColor,
    super.backgroundColor,
    super.strokeCap,
    super.minHeight,
    this.materialAppWraper = false,
    this.canPop = false,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = PopScope(
      canPop: canPop,
      child: Scaffold(body: super.build(context)),
    );
    return materialAppWraper
        ? MaterialApp(title: 'Wait...', debugShowCheckedModeBanner: kDebugMode, home: scaffold)
        : scaffold;
  }
}

class LoadingWidget extends StatelessWidget {
  final bool linear;
  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final StrokeCap strokeCap;
  final double? minHeight;

  const LoadingWidget(
      {super.key,
      this.linear = false,
      this.value,
      this.valueColor,
      this.backgroundColor,
      this.strokeCap = StrokeCap.butt,
      this.minHeight});

  @override
  Widget build(BuildContext context) {
    return linear
        ? LinearProgressIndicator(
            value: value,
            valueColor: valueColor,
            minHeight: minHeight,
            backgroundColor: backgroundColor,
            borderRadius: BorderRadius.circular(strokeCap.index * 2),
          )
        : Center(
            child: SizedBox.square(
            dimension: minHeight ?? kToolbarHeight,
            child: CircularProgressIndicator.adaptive(
              value: value,
              strokeCap: strokeCap,
              backgroundColor: backgroundColor,
              valueColor: valueColor,
            ),
          ));
  }
}

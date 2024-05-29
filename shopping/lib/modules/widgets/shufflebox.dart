// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShuffleBox extends StatefulWidget {
  final double gap;
  final double width;
  final int crossAxisCount;
  final Curve curve;
  final Duration duration;
  final List<Widget> children;
  final ShuffleBoxController controller;
  const ShuffleBox({
    super.key,
    required this.width,
    required this.crossAxisCount,
    required this.children,
    required this.controller,
    this.curve = Curves.decelerate,
    this.gap = 8,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<ShuffleBox> createState() => _ShuffleBoxState();
}

class _ShuffleBoxState extends State<ShuffleBox> {
  late int crossAxisCount;
  late List<Rect> position;

  void shuffle([int? max]) {
    if (max != null && max > 1 && max < position.length - 1) {
      int end = Random().nextInt(position.length - max) + max;
      var replacements = position.sublist(end - max, end)..shuffle();
      position.replaceRange(end - max, end, replacements);
    } else {
      position.shuffle();
    }
    if (mounted) setState(() {});
  }

  int _getBestCrossAxisCount(int n, int l) {
    for (int i = n; i > 0; i--) {
      if (l % i == 0) return i;
    }
    return l;
  }

  @override
  void initState() {
    setPositionAndCrossAxisCount();
    widget.controller.state = this;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShuffleBox oldWidget) {
    if (oldWidget.width != widget.width) {
      setPositionAndCrossAxisCount();
    }
    widget.controller.state = this;
    super.didUpdateWidget(oldWidget);
  }

  void setPositionAndCrossAxisCount() {
    crossAxisCount = _getBestCrossAxisCount(widget.crossAxisCount, widget.children.length);
    position = List.generate(widget.children.length, (i) => _getRectangle(i));
  }

  @override
  void dispose() {
    widget.controller.dispose();
    widget.controller.state = null;
    super.dispose();
  }

  double get boxPerColumn => widget.children.length / crossAxisCount;
  @override
  Widget build(BuildContext context) {
    var height = (boxPerColumn * position.first.height) + ((boxPerColumn - 1) * widget.gap);
    return SizedBox(
      height: height,
      child: Stack(children: [
        for (int i = 0; i < widget.children.length; i++)
          AnimatedPositioned.fromRect(
            rect: position[i],
            duration: widget.duration,
            curve: widget.curve,
            child: widget.children[i],
          ),
      ]),
    );
  }

  Rect _getRectangle(int index) {
    double size = (widget.width - ((crossAxisCount - 1) * widget.gap)) / crossAxisCount;
    return Offset(
          index ~/ boxPerColumn * (size + widget.gap),
          index % boxPerColumn * (size + widget.gap),
        ) &
        Size.square(size);
  }
}

class ShuffleBoxController extends ChangeNotifier {
  _ShuffleBoxState? _internalState;
  Timer? _autoShuffleTimer;

  ShuffleBoxController({Duration? autoShuffleDuration}) {
    if (autoShuffleDuration != null) {
      _autoShuffleTimer = Timer.periodic(
        autoShuffleDuration,
        (_) => shuffle(),
      );
    }
  }

  /// The internal widget state. Use only if you know what you're doing!
  ///
  /// This will throw an [AssertionError] if controller has not been
  /// assigned to a [_ShuffleBoxState] widget or state has not been initialized
  _ShuffleBoxState get state {
    assert(
      _internalState != null,
      'Controller not attached to any ShuffleBox. Did you forget to pass the controller to the ShuffleBox?',
    );
    return _internalState!;
  }

  /// Set the internal state
  set state(_ShuffleBoxState? value) => _internalState = value;

  void shuffle([int? max]) => _internalState?.shuffle(max);

  @override
  void dispose() {
    _autoShuffleTimer?.cancel();
    super.dispose();
  }
}

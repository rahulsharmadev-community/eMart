// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:jars/jars.dart';

// typedef OnWidgetSizeChange = void Function(Size size);

// class WidgetSizeRenderObject extends RenderProxyBox {
//   Size? oldSize;
//   final OnWidgetSizeChange onChange;

//   WidgetSizeRenderObject(this.onChange);

//   @override
//   void performLayout() {
//     super.performLayout();

//     Size newSize = child?.size ?? Size.zero;
//     if (oldSize == newSize) return;
//     oldSize = newSize;
//     WidgetsBinding.instance.addPostFrameCallback((_) => onChange(newSize));
//   }
// }

// class MesureSize extends StatefulWidget {
//   const MesureSize({super.key});

//   @override
//   State<MesureSize> createState() => _MesureSizeState();
// }

// class _MesureSizeState extends State<MesureSize> with AfterLayoutMixin {
//   @override
//   FutureOr<void> afterFirstLayout(BuildContext context, Duration timeStamp) {
//       var context = widgetKey.currentContext;
//       if (context == null) return;

//       var newSize = context.size;
//       if (oldSize == newSize || newSize == null) return;

//       oldSize = newSize;
//       widget.onChange(newSize);
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


// // class MeasureSize extends SingleChildRenderObjectWidget {
// //   final OnWidgetSizeChange onChange;

// //   const MeasureSize({
// //     super.key,
// //     required this.onChange,
// //     required Widget super.child,
// //   });
// //   Widget Function
// //   @override
// //   RenderObject createRenderObject(BuildContext context) {
// //     return WidgetSizeRenderObject(onChange);
// //   }
// // }

// // class MyWidget extends StatefulWidget {
// //   const MyWidget({super.key});

// //   @override
// //   State<MyWidget> createState() => _MyWidgetState();
// // }

// // class _MyWidgetState extends State<MyWidget> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

import 'forms/product_details.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormProgressStepper(
        stepNotifier: ValueNotifier(0),
      ),
    );
  }
}

class FormProgressStepper extends StatelessWidget {
  const FormProgressStepper({
    super.key,
    required this.stepNotifier,
  });

  final ValueNotifier<int> stepNotifier;

  @override
  Widget build(BuildContext context) {
    const empty = SizedBox.shrink();

    Step createStep(bool larger, String text, bool isActive) {
      var title = Text(text);
      return Step(
          title: larger ? title : empty,
          label: larger ? empty : title,
          isActive: isActive,
          state: StepState.disabled,
          content: const ProductDetails());
    }

    return ValueListenableBuilder(
        valueListenable: stepNotifier,
        builder: (context, value, child) {
          var larger = context.activeWindowSize.breakpoint > WindowSize.MEDIUM.breakpoint;
          return Stepper(
              margin: EdgeInsets.zero,
              currentStep: value,
              type: context.activeWindowSize == WindowSize.COMPACT
                  ? StepperType.vertical
                  : StepperType.horizontal,
              controlsBuilder: (context, details) => const SizedBox.shrink(),
              steps: [
                createStep(larger, 'Product Details', value == 0),
                createStep(larger, 'Description & Keywords', value == 1),
                createStep(larger, 'Upload Images', value == 2),
                createStep(larger, 'After sale service', value == 3),
                createStep(larger, 'Price & Availablity', value == 4),
              ]);
        });
  }
}

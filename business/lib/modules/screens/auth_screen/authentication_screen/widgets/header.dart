import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jars/jars.dart';

import '../../widgets/google_oauth_button.dart';

class Header extends StatelessWidget {
  final List<Widget> actions;
  const Header({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kToolbarHeight * 1.5,
        child: Row(
          children: [
            16.gap,
            title(),
            const Spacer(),
            actionsWidgets(),
            16.gap,
          ],
        ));
  }

  Row actionsWidgets() {
    return Row(
      children: [
        FilledButton.icon(
          onPressed: () {},
          label: const Text('Create Account'),
          icon: const Icon(Icons.add_rounded),
        ),
        8.gap,
        const GoogleOAuthButton(
          label: 'Sign In',
          round: true,
        )
      ],
    );
  }

  Text title() => const Text('eMartBusiness');
}

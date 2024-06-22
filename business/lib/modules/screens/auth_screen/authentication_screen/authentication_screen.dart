import 'package:business/modules/screens/auth_screen/authentication_screen/widgets/background_banner.dart';
import 'package:business/modules/screens/auth_screen/authentication_screen/widgets/custom_card.dart';
import 'package:business/modules/screens/auth_screen/authentication_screen/widgets/feature_card.dart';
import 'package:business/modules/screens/auth_screen/authentication_screen/widgets/header.dart';
import 'package:business/modules/screens/auth_screen/widgets/google_oauth_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jars/jars.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _AuthenticationScreenBuilder(),
    );
  }
}

class _AuthenticationScreenBuilder extends StatelessWidget {
  const _AuthenticationScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var actionButtons = [
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
    ];
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundBanner(),
          Header(actions: actionButtons),
          restrictedLayout(
            children: [
              const FeatureCard(),
              Row(children: [
                Column(children: [
                  const Text('title'),
                  const Text('subtitle'),
                  Row(children: actionButtons),
                  16.gap,
                  const Text(
                    '*T&C Apply',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  )
                ]),
                Image.network('https://placehold.co/400x600.png')
              ]),
              24.gap,
              const Text('Why should you partner with eMart?'),
              8.gap,
              const Text(
                  'eMart enables you to get 60% more revenue, 10x new customers and boost your brand visibility by providing insights to improve your business.'),
              16.gap,
              Row(
                  children: []
                      .map((e) => const CustomCard(
                            imgSrc: '',
                            title: '',
                            substitle: '',
                          ))
                      .toList())
            ],
          )
        ],
      ),
    );
  }

  Widget restrictedLayout({required List<Widget> children}) {
    return SizedBox(
      width: 900,
      child: Column(children: children),
    );
  }
}

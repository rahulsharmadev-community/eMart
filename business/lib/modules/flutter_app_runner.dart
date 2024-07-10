// ignore_for_file: use_build_context_synchronously, camel_case_types
import 'package:business/modules/screens/auth_screen/auth_cubit/auth_cubit.dart';
import 'package:business/modules/screens/auth_screen/registration_screen/registration_screen.dart';
import 'package:business/modules/screens/auth_screen/widgets/google_oauth_button.dart';
import 'package:business/modules/screens/other/loading_screen.dart';
import 'package:business/utility/routes/route_config.dart';

import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class eMartBusinessAppRunner extends StatelessWidget {
  const eMartBusinessAppRunner({super.key});

  Widget builder(context, state) {
    switch (state) {
      case InValidEmployeeId _:
        return RegistrationScreen(user: state.user); // google authorized but not employee
      case FailedAuthentication _:
        return RetryScreen(message: state.message); // not google authorized
      case Authenticated _:
        return const eMartBusiness(); // google authorized & employee
      default:
        return const WaitingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const eMartBusiness();
    // return BlocProvider(
    //   create: (context) => AuthCubit(FirebaseService.eMartSeller.instanceOfAuth)..signIn(),
    //   child: BlocBuilder<AuthCubit, AuthState>(builder: builder),
    // );
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen(materialAppWraper: true);
  }
}

class RetryScreen extends StatelessWidget {
  final String message;
  const RetryScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        color: Colors.black12,
        home: Center(
          child: AlertJDialog(
            icon: Icon(Icons.loop_rounded),
            title: 'Try Again to complete login',
            content:
                'Login on eMart and manage sales, inventory and your business operations on the Seller Central dashboard.',
            config: JDialogConfig(elevation: 8),
            actions: [
              GoogleOAuthButton(
                label: 'Sign In',
                round: true,
              )
            ],
          ),
        ));
  }
}

class eMartBusiness extends StatelessWidget {
  const eMartBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return GoMaterialApp(
      config: defaultRouterConfig,
      theme: ThemeData(textTheme: const TextTheme(bodyLarge: TextStyle(fontSize: 14))),
    );
  }
}

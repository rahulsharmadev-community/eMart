import 'package:business/modules/screens/auth_screen/auth_cubit/auth_cubit.dart';
import 'package:business/modules/screens/auth_screen/registration_screen/bloc/registration_form_bloc.dart';
import 'package:business/modules/screens/other/loading_screen.dart';
import 'package:business/services/geolocator_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared/models.dart' as models;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:jars/regpatterns.dart';

part 'widget/form_content.dart';
part 'widget/form_header.dart';
part 'widget/form_footer.dart';

class RegistrationScreen extends StatelessWidget {
  final User user;
  const RegistrationScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationFormBloc(user: user),
      child: const MaterialApp(
        home: _BuildingForm(),
      ),
    );
  }
}

class _BuildingForm extends StatelessWidget {
  const _BuildingForm();
  @override
  Widget build(BuildContext context) {
    const formHeader = FormHeader();
    const formContent = FormContent();

    Widget compact() {
      return Column(children: [
        formHeader,
        formContent.tightFit(),
      ]);
    }

    Widget other() {
      return Row(children: [
        formHeader.looseFit(),
        8.gap,
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
          child: formContent,
        ).looseFit()
      ]);
    }

    return BlocListener<RegistrationFormBloc, RegistrationFormState>(
      listener: (context, state) {
        if (state is FormErrorState) {
          showJTost(context, msg: state.message);
        }
        if (state is FormSubmitedSuccessState) {
          context.read<AuthCubit>().employeeVarification();
        }
      },
      child: Scaffold(
          body: FormLayoutBuilder(
        compact: compact(),
        other: other(),
      )),
    );
  }
}

class FormLayoutBuilder extends StatelessWidget {
  final Widget compact;
  final Widget other;
  const FormLayoutBuilder({
    super.key,
    required this.compact,
    required this.other,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var notCompact = context.activeWindowSize != WindowSize.COMPACT;
      var constraints = BoxConstraints(maxHeight: notCompact ? 500 : 600, maxWidth: 1000);
      var padding = EdgeInsets.symmetric(horizontal: notCompact ? 32 : 24, vertical: notCompact ? 24 : 24);
      return Center(
        child: ConstrainedBox(
          constraints: constraints.copyWith(maxHeight: constraints.maxHeight + kToolbarHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  constraints: constraints,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      shadows: const [BoxShadow(color: Colors.black12, blurRadius: 10)]),
                  padding: padding,
                  child: notCompact ? other : compact),
              const FormFooter(),
            ],
          ),
        ),
      );
    });
  }
}

part of 'registration_form_bloc.dart';

sealed class RegistrationFormState {
  RegistrationFormState();
}

class FormIdleState extends RegistrationFormState {}

class FormLoadingState extends RegistrationFormState {
  FormLoadingState();
}

class FormSubmitedSuccessState extends RegistrationFormState {
  FormSubmitedSuccessState();
}

class FormErrorState extends RegistrationFormState {
  final String message;
  FormErrorState(this.message);
}

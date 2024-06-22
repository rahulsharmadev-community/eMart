part of 'form_bloc.dart';

sealed class RFormState {}

class FormIdleState extends RFormState {
  FormIdleState();
}

class FormFillingState extends RFormState {
  FormFillingState();
}

class FormReadyToSubmitState extends RFormState {
  FormReadyToSubmitState();
}

class FormSubmitedSuccessState extends RFormState {
  FormSubmitedSuccessState();
}

class FormErrorState extends RFormState {
  final String message;
  FormErrorState(this.message);
}

part of 'form_bloc.dart';

sealed class FormAddressState {}

class FormIdleState extends FormAddressState {
  FormIdleState();
}

class FormFetchingDataState extends FormAddressState {
  FormFetchingDataState();
}

class FormFillingState extends FormAddressState {
  FormFillingState();
}

class FormFetchCompleteState extends FormAddressState {
  FormFetchCompleteState();
}

class FormReadyToSubmitState extends FormAddressState {
  FormReadyToSubmitState();
}

class FormSubmitedSuccessState extends FormAddressState {
  FormSubmitedSuccessState();
}

class FormErrorState extends FormAddressState {
  final String message;
  FormErrorState(this.message);
}

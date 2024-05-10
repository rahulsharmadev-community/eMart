// ignore_for_file: camel_case_types

part of 'e_mart_shopping_cubit.dart';

sealed class eMartShoppingState {
  const eMartShoppingState();
}

class eMartShoppingLoading extends eMartShoppingState {}

class AuthenticatedState extends eMartShoppingState {
  final String uid;
  const AuthenticatedState({required this.uid});
}

class UnauthenticatedState extends eMartShoppingState {}

class ConnectionErrorState extends eMartShoppingState {}

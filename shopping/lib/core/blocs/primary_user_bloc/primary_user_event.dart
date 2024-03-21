part of 'primary_user_bloc.dart';

@immutable
sealed class PrimaryUserEvent {
  static PrimaryUserInitialize initialize(Consumer consumer) => PrimaryUserInitialize(consumer);
  static PrimaryUserDispose dispose() => PrimaryUserDispose();
  static UpdateEvent update(Consumer consumer) => UpdateEvent(consumer);
}

class PrimaryUserInitialize extends PrimaryUserEvent {
  final Consumer user;
  PrimaryUserInitialize(this.user);
}

class PrimaryUserDispose extends PrimaryUserEvent {}

class UpdateEvent extends PrimaryUserEvent {
  final Consumer consumer;

  UpdateEvent(this.consumer);
}

part of 'auth_cubit.dart';

typedef AuthState = BlocState<Employee>;
typedef Authenticated = BlocStateSuccess<Employee>;
typedef Unauthenticated = BlocStateInitial<Employee>;
typedef Authenticating = BlocStateLoading<Employee>;
typedef FailedAuthentication = BlocStateFailure<Employee>;

class InValidEmployeeId extends AuthState {
  final User user;

  const InValidEmployeeId(this.user);
  String get message => "Employee email ID not associated with any store.";
}

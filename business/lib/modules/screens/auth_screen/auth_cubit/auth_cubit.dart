import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jars/jars.dart';
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';
import 'package:shared_repositories/repositories.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth firebaseAuth;
  final EmployeesRepository repository = EmployeesRepository();
  AuthCubit(this.firebaseAuth) : super(Unauthenticated());
  User? get user => firebaseAuth.currentUser;

  void signIn() async {
    if (state is Authenticated) return;
    tryCatch(
      () async {
        if (user == null) {
          await firebaseAuth.signInWithPopup(GoogleAuthProvider());
        }

        if (user?.email != null) {
          var employee = await repository.getByEmail(user!.email!);
          if (employee == null) {
            emit(InValidEmployeeId(user!));
          } else {
            emit(Authenticated(employee));
          }
        }
      },
    );
  }

  void createEmployee({
    required PersonName name,
    required String phoneNumber,
    required String panNumber,
    required Address address,
    String? profileImg,
  }) async {
    tryCatch(() async {
      var employee = Employee(
        name: name,
        email: user!.email!,
        phoneNumber: phoneNumber,
        address: address,
        panNumber: panNumber,
        profileImg: profileImg ?? user?.photoURL,
        role: EmployeeRole.primaryOwner,
      );
      await repository.createNewEmployee(employee);
      emit(Authenticated(employee));
    });
  }

  void signOut() async {
    emit(const Authenticating());
    tryCatch(() async {
      await firebaseAuth.signOut();
      emit(Unauthenticated());
    });
  }

  void tryCatch(Function callback) async {
    try {
      await callback();
    } on FirebaseAuthException catch (e) {
      emit(FailedAuthentication(e.message ?? 'Unknow exception!'));
    }
  }
}

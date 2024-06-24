import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jars/jars.dart';
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

        await employeeVarification();
      },
    );
  }

  Future<void> employeeVarification() async {
    if (user?.email != null) {
      var employee = await repository.getByEmail(user!.email!);
      if (employee == null) {
        emit(InValidEmployeeId(user!));
      } else {
        emit(Authenticated(employee));
      }
    }
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

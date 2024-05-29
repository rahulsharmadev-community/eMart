part of 'keyword_bloc.dart';

typedef SearchState = BlocState<Keywords>;
typedef SearchStateEmpty = BlocStateInitial<Keywords>;
typedef SearchStateLoading = BlocStateLoading<Keywords>;
typedef SearchStateSuccess = BlocStateSuccess<Keywords>;
typedef SearchStateError = BlocStateFailure<Keywords>;

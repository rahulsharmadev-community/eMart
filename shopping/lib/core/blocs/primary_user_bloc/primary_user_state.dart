// // ignore_for_file: camel_case_types

// part of 'primary_user_bloc.dart';

// @immutable
// sealed class PrimaryUserState {
//   static PrimaryUserState fromJson(JSON json) {
//     final state = json['state'];
//     switch (state) {
//       case 'PrimaryUserLoading':
//         return PrimaryUserLoading();
//       case 'PrimaryUserError':
//         return PrimaryUserError.fromJson(json);
//       default:
//         return PrimaryUserLoaded.fromJson(json);
//     }
//   }

//   JSON toJson() => {'state': '$runtimeType'};
// }

// class PrimaryUserLoading extends PrimaryUserState {}

// class PrimaryUserError extends PrimaryUserState {
//   final String errorMsg;
//   PrimaryUserError(this.errorMsg);

//   factory PrimaryUserError.fromJson(JSON json) => PrimaryUserError(json['errorMsg']);
//   @override
//   JSON toJson() => {'state': '$runtimeType', 'errorMsg': errorMsg};
// }

// class PrimaryUserLoaded extends PrimaryUserState {
//   final Consumer user;
//   PrimaryUserLoaded(this.user);

//   factory PrimaryUserLoaded.fromJson(JSON json) => PrimaryUserLoaded(Consumer.fromJson(json['user']));

//   @override
//   JSON toJson() => {'state': '$runtimeType', 'user': user.toJson()};
// }

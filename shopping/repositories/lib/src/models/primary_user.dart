import 'package:equatable/equatable.dart';
import 'package:repositories/repositories.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared/models.dart';

part 'primary_user.g.dart';

@CopyWith()
class PrimaryUser extends Equatable {
  final Consumer user;
  final UserActivity userActivity;
  const PrimaryUser({required this.user, required this.userActivity});

  @override
  List<Object?> get props => [user, userActivity];
}

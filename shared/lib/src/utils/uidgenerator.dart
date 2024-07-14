import 'package:shared/src/credentials/const_credential.dart';
import 'package:uuid/uuid.dart';

/// Generates a unique identifier by combining a prefix with segments of UUIDs.
String uidGenerator({String? prefix, String? baseStr, bool compact = false}) {
  prefix = prefix ?? '';
  const uuid = Uuid();
  var v4 = uuid.v4().split('-');
  var randID = compact ? v4.first : v4.first + v4.last;

  if (baseStr == null) return prefix + randID;

  var id = uuid.v5(SECURE_NAMESPACE, baseStr).split('-');
  return prefix + id.first + randID;
}

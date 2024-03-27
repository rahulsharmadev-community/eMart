import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:logger/logger.dart";

final logs = Logger();
mixin CustomExceptionHandler {
  Future<T?> errorHandler<T>(Future<T?> Function() callback) async {
    try {
      return await callback();
    } on DioException catch (ferror) {
      logs.e('${ferror.error}\n${ferror.message}\n${ferror.requestOptions.uri}');
    } on FirebaseException catch (ferror) {
      logs.e('${ferror.message}');
    } catch (error) {
      logs.e('$error');
    }
    return null;
  }
}

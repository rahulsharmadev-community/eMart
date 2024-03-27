// ignore_for_file: constant_identifier_names
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:shared/models.dart';
import 'package:shopping/modules/screens/home_screen/home_screen.dart';
import 'package:shopping/modules/screens/other_screens/error_screen.dart';
import 'package:shopping/modules/screens/other_screens/image_preview_screen.dart';
import 'package:shopping/modules/screens/other_screens/loading_screen.dart';
import 'package:shopping/modules/screens/search_screen/search_screen.dart';
import 'package:shopping/utility/utility.dart';
part 'app_router.dart';

/// This enum represents the different routes or screens available in the app.
///
/// A static [config] variable that holds the [GoRouter] configuration.
enum AppRoutes {
  HomeScreen('home_screen'),
  SearchKeywordScreen('search_keyword_screen'),

  ///```
  /// Function(List<(String, Uint8List)>) onPreview: extra['onPreview'],
  /// bool forceOnlyOneClick: extra['forceOnlyOneClick'],
  /// VoidCallback onPop: AppNavigator.pop,
  /// ```
  CameraScreen('camera_screen'),

  /// String title\
  /// String? url\
  /// Uint8List? bytes
  ImagePreviewScreen('image_preview_screen'),
  SettingsScreen('settings_screen'),
  PrivacyHandlingScreen('privacy_handling_screen'),
  HelpCenterScreen('help_center_screen'),
  ErrorScreen('error_screen'),
  LoadingScreen('loading_screen');

  const AppRoutes(this.name);
  final String name;

  static GoRouter config = _AppRouter.internal().run;

  static void pop<T extends Object?>({T? result, int count = 1}) =>
      AppNavigator.pop<T>(count: count, result: result);

  Future<dynamic> pushNamed(
          {Map<String, String> pathParameters = const <String, String>{},
          Map<String, dynamic> queryParameters = const <String, dynamic>{},
          Object? extra}) =>
      AppNavigator.on((router) => router.pushNamed(name,
          extra: extra, pathParameters: pathParameters, queryParameters: queryParameters));

  Future<void> goNamed(
          {Map<String, String> pathParameters = const <String, String>{},
          Map<String, dynamic> queryParameters = const <String, dynamic>{},
          Object? extra}) =>
      AppNavigator.on((router) => router.goNamed(name,
          extra: extra, pathParameters: pathParameters, queryParameters: queryParameters));

  Future<void> replaceNamed(
          {Map<String, String> pathParameters = const <String, String>{},
          Map<String, dynamic> queryParameters = const <String, dynamic>{},
          Object? extra}) =>
      AppNavigator.on((router) => router.replaceNamed(name,
          extra: extra, pathParameters: pathParameters, queryParameters: queryParameters));

  Future<void> pushReplacementNamed(
          {Map<String, String> pathParameters = const <String, String>{},
          Map<String, dynamic> queryParameters = const <String, dynamic>{},
          Object? extra}) =>
      AppNavigator.on((router) => router.pushReplacementNamed(name,
          extra: extra, pathParameters: pathParameters, queryParameters: queryParameters));

  Future<void> push({Object? extra}) => AppNavigator.on((router) => router.push(
        name,
        extra: extra,
      ));

  Future<void> replace({Object? extra}) => AppNavigator.on((router) => router.replace(
        name,
        extra: extra,
      ));
}

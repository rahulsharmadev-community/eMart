import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

export 'bloc_observer/bloc_observer.dart';
export 'navigation/app_navigator.dart';
export 'navigation/app_navigator_observer.dart';
export 'routes/app_routes.dart';
export 'extensions.dart';

extension CTX on BuildContext {
  Widget buildFor({
    Widget? web,
    Widget? macOS,
    Widget? windows,
    Widget? linux,
    Widget? android,
    Widget? iOS,
    Widget? fuchsia,
    Widget? others,
    Widget? mobile,
    Widget? desktop,
  }) {
    if (PlatformQuery.isAndroid && android != null) return android;
    if (PlatformQuery.isIOS && iOS != null) return iOS;
    if (PlatformQuery.isMobileorTablet && mobile != null) return mobile;
    if (PlatformQuery.isLinux && linux != null) return linux;
    if (PlatformQuery.isWindows && windows != null) return windows;
    if (PlatformQuery.isMacOS && macOS != null) return macOS;
    if (PlatformQuery.isDesktop && desktop != null) return desktop;
    if (PlatformQuery.isWeb && web != null) return web;
    if (PlatformQuery.isFuchsia && fuchsia != null) return fuchsia;

    // Default behavior if no platform-specific widget is provided
    return const Placeholder(
      child: Text('No Widget Define'),
    ); // or any other suitable default widget
  }
}

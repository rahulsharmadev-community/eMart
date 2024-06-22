import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

const _svg =
    '''<svg xmlns="http://www.w3.org/2000/svg" width="1440" height="519" fill="none" viewBox="0 0 1440 519">
  <path fill="url(#a)" d="M0 0h1440v518.367H0z"/>
  <defs>
    <linearGradient id="a" x1="720" x2="720" y1="0" y2="518.367" gradientUnits="userSpaceOnUse">
      <stop stop-color="color(display-p3 .192 .8546 1)"/>
      <stop offset="1" stop-color="color(display-p3 .1938 .414 .7787)"/>
    </linearGradient>
  </defs>
</svg>
''';

class BackgroundBanner extends StatelessWidget {
  const BackgroundBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SvgPicture.string(
      _svg,
      fit: BoxFit.cover,
      height: 500,
    ));
  }
}

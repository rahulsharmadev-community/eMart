import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  });

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: press,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all((12)),
              height: (46),
              width: (46),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(svgSrc),
            ),
            if (numOfitem != 0)
              Positioned(
                top: -3,
                right: 0,
                child: Container(
                  height: (16),
                  width: (16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4848),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      "$numOfitem",
                      style: const TextStyle(
                        fontSize: (10),
                        height: 1,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talkio_app/utils/colors.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: 200,
      colorFilter: ColorFilter.mode(
        kPrimaryColor,
        BlendMode.srcIn,
      ),
    );
  }
}

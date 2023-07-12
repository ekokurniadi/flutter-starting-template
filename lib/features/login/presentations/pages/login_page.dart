import 'package:flutter/material.dart';
import 'package:instapos/core/helpers/screen_type_helper.dart';
import 'package:instapos/features/login/presentations/pages/smartphone/login_page_mobile.dart';
import 'package:instapos/features/login/presentations/pages/tablet/login_page_tablet.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeHelper(
      tablet: LoginPageTablet(),
      desktop: LoginPageTablet(),
      mobile: LoginPageMobile(),
    );
  }
}

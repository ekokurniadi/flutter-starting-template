import 'package:auto_route/annotations.dart';
import 'package:instapos/features/login/presentations/pages/login_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginPage,
      initial: true,
    ),
  ],
)
// ignore: prefer-match-file-name
class $AppRouter {}

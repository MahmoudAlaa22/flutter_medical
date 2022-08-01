import 'package:get/get.dart';

import '../../modules/home_page/home_page.dart';
import '../../modules/sign_up_page/sign_up_page.dart';

class AppPages {
  ///uncomment this row to make initial sign_up_page when app start
  static const initial = SignUpPage.routeName;
  // static const initial = HomePage.routeName;

  static final routes = [
    ///This row to make route to any page.
    GetPage(
      name: SignUpPage.routeName,
      page: () =>  SignUpPage(),
    ),
    GetPage(
      name: HomePage.routeName,
      page: () =>  HomePage(),
    ),

  ];
}

import 'package:get/get.dart';

import '../logic/logic_binding.dart';
import '../logic/logic_screen.dart';

class AppPages {
  static const initial = "/home";
  static final routes = [
    GetPage(
      name: initial,
      page: () => const LogicScreen(),
      binding: LogicBinding(),
    )
  ];
}

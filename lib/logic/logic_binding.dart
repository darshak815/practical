import 'package:get/get.dart';
import 'logic_controller.dart';

class LogicBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LogicController>(() => LogicController());
  }
}

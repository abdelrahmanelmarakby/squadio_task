import 'package:get/get.dart';
import 'package:squadio_task/app/modules/details/controllers/details_controller.dart';
import 'package:squadio_task/app/modules/home/controllers/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DetailsController());
  }
}

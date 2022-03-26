import 'package:get/get.dart';
import 'package:squadio_task/app/modules/details/controllers/details_controller.dart';
import 'package:squadio_task/app/modules/home/controllers/home_controller.dart';
import 'package:squadio_task/app/modules/search/controllers/search_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => DetailsController(), fenix: true);

    Get.lazyPut(() => SearchController(), fenix: true);
  }
}

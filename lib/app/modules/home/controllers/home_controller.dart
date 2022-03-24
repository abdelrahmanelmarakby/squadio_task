import 'package:get/get.dart';
import 'package:squadio_task/core/consts.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeController extends GetxController {
  Future<Map> getData() async {
    Map trending = await Constants.tmdbWithCustomLogs.v3.people.getPopular();
    print(trending);
    return trending;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

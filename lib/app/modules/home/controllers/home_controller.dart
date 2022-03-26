import 'package:get/get.dart';
import 'package:squadio_task/app/data/apis/home_apis.dart';
import 'package:squadio_task/app/data/models/actors_model.dart';
import 'package:squadio_task/core/consts.dart';

class HomeController extends GetxController {
  RxList<ActorsModel> actors = <ActorsModel>[].obs;

  Future<List<ActorsModel>> getData() async {
    actors.value = await HomeApis.getActors();
    return actors;
  }
}

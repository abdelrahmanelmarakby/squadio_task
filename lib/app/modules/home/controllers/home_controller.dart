import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squadio_task/app/data/apis/home_apis.dart';
import 'package:squadio_task/app/data/models/actors_model.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  late ScrollController scrollController;
  RxList<ActorsModel> actors = <ActorsModel>[].obs;

  Future<List<ActorsModel>> getData() async {
    await HomeApis.getActors().then((value) => actors.value = value);
    return actors;
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(pagination);
    super.onInit();
  }

  void pagination() async {
    if ((scrollController.position.pixels ==
        scrollController.position.maxScrollExtent)) {
      isLoading.value = true;
      actors.addAll(await HomeApis.getActors()

          //add api for load the more data according to new page
          );
      print(actors.length);
      HomeController().update();
      isLoading.value = false;
    }
  }
}

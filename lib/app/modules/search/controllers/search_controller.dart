import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squadio_task/app/data/models/actors_model.dart';

class SearchController extends GetxController {
  late final TextEditingController searchController;
  //search  in actors Function that returns a List and show them reactivly
  RxList<ActorsModel> actors = Get.arguments;

  List<ActorsModel> searchActors(String search) {
    actors.value = actors
        .where((actor) =>
            actor.firstName!.toLowerCase().contains(search) ||
            actor.fullName!.toLowerCase().contains(search) ||
            actor.lastName!.toLowerCase().contains(search))
        .toList();
    if (actors.isEmpty) {
      actors = Get.arguments;
    }
    return actors;
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    actors = Get.arguments;

    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    actors = Get.arguments;
    SearchController().dispose();
    super.dispose();
  }
}

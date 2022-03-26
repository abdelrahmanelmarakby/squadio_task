import 'dart:convert';

import 'package:get/get.dart';
import 'package:squadio_task/app/data/models/actors_model.dart';
import 'package:squadio_task/core/consts.dart';

class DetailsController extends GetxController {
  final ActorsModel actor = Get.arguments["person"];
  Future<Map> getData() async {
    Map trending = await Constants.tmdbWithCustomLogs.v3.people
        .getDetails(actor.id!.toInt());
    print(trending);
    return trending;
  }
}

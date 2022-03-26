import 'dart:convert';

import 'package:get/get.dart';
import 'package:squadio_task/app/data/models/actors_model.dart';
import 'package:squadio_task/core/consts.dart';

class DetailsController extends GetxController {
  final ActorsModel actor = Get.arguments["person"];
}

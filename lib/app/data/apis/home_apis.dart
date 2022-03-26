// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import "package:get_storage/get_storage.dart";
import 'package:squadio_task/app/data/models/actors_model.dart';

class HomeApis {
//get List of actors from api with pagination and cache it
  static Future<List<ActorsModel>> getActors() async {
    try {
      var dio = Dio();
      var response = await dio.get("https://thronesapi.com/api/v2/Characters");
      var data = response.data;
      var actors = data;
      List<ActorsModel> actorsList = <ActorsModel>[];
      for (var actor in actors) {
        actorsList.add(ActorsModel.fromJson(actor));
      }
      print(actorsList);
      GetStorage().write("actors", actorsList);
      return actorsList;
    } on DioError catch (e) {
      print(e.error);
      return GetStorage().read("actors");
    }
  }
}

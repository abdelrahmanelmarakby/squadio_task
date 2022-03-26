// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:ease/Utilities_and_helper_widgets/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:get_storage/get_storage.dart";
import 'package:squadio_task/app/data/models/actors_model.dart';

class HomeApis {
//get List of actors from api with pagination and cache it
  static Future<List<ActorsModel>> getActors() async {
    bool isConnected = await EaseConnectivityService.checkConnectivity();
    try {
      if (isConnected) {
        final dio = Dio()
          ..interceptors.add(DioCacheInterceptor(
              options: CacheOptions(
            store: MemCacheStore(),
            maxStale: Duration(days: 7),
          )));

        var response =
            await dio.get("https://thronesapi.com/api/v2/Characters");

        var data = response.data;
        var actors = data;
        GetStorage().write("actors", actors);
        List<ActorsModel> actorsList = <ActorsModel>[];
        for (var actor in actors) {
          actorsList.add(ActorsModel.fromJson(actor));
        }
        print(actorsList);

        return actorsList;
      } else {
        var actors = await GetStorage().read("actors");

        actors = await GetStorage().read("actors");
        List<ActorsModel> actorsList = <ActorsModel>[];
        for (var actor in actors) {
          actorsList.add(ActorsModel.fromJson(actor));
        }
        print(actorsList);
        return actorsList;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Unknow error occured",
        backgroundColor: Colors.red.shade900.withOpacity(.7),
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
      );
      print(e);

      return <ActorsModel>[];
    }
  }
}

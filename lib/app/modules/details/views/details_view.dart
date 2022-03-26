import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:squadio_task/app/data/models/actors_model.dart';
import 'package:squadio_task/core/resourses/color_manger.dart';
import 'package:squadio_task/core/resourses/styles_manger.dart';
import 'package:squadio_task/core/resourses/values_manger.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            controller.actor.fullName ?? "N/A",
            style: getMediumTextStyle(fontSize: 22, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ActorImage(controller: controller, person: controller.actor),
              SizedBox(height: AppPadding.padding8),
              ActorDescription(),
            ],
          ),
        ));
  }
}

class ActorImage extends StatelessWidget {
  const ActorImage({
    Key? key,
    required this.controller,
    required this.person,
  }) : super(key: key);

  final DetailsController controller;
  final ActorsModel? person;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(20, 10),
          color: Colors.grey.withOpacity(0.25),
          blurRadius: 10,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding20),
        child: Stack(
          children: [
            Hero(
                tag: Get.arguments['heroTag'],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppPadding.padding12),
                  child: Image.network(
                    person?.imageUrl ?? "",
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Text("Can't load image"),
                    ),
                    height: MediaQuery.of(context).size.height / 2.1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_circle_down, color: Colors.white),
                  onPressed: () async {
                    await ImageDownloader.downloadImage(person?.imageUrl ?? "",
                            destination:
                                AndroidDestinationType.directoryPictures)
                        .then((value) => Get.snackbar("Downloaded",
                            "Image Downloaded Successfully to Gallery "));
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class ActorDescription extends StatelessWidget {
  ActorDescription({Key? key}) : super(key: key);
  DetailsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.padding18),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(AppPadding.padding12),
            boxShadow: [
              BoxShadow(
                offset: Offset(20, 10),
                color: Colors.grey.withOpacity(0.25),
                blurRadius: 10,
              ),
            ]),
        child: Column(
          children: ListTile.divideTiles(tiles: [
            ListTile(
              title: Text("First Name"),
              subtitle: Text(
                controller.actor.firstName ?? "N/A",
                style: getMediumTextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            ListTile(
              title: Text("Last Name"),
              subtitle: Text(
                controller.actor.lastName ?? "N/A",
                style: getMediumTextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            ListTile(
              title: Text("Family Name"),
              subtitle: Text(
                controller.actor.family ?? "N/A",
                style: getMediumTextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          ], context: context)
              .toList(),
        ),
      ),
    );
  }
}

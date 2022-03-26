import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squadio_task/app/data/models/actors_model.dart';
import 'package:squadio_task/app/routes/app_pages.dart';
import 'package:squadio_task/core/resourses/color_manger.dart';
import 'package:squadio_task/core/resourses/styles_manger.dart';
import 'package:squadio_task/core/resourses/values_manger.dart';
import 'package:squadio_task/core/services/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: FutureBuilder<List<ActorsModel>>(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<ActorsModel>? actors = snapshot.data;
                return Obx(() {
                  return Column(
                    children: [
                      PopularListView(
                        actors: actors,
                      ),
                      controller.isLoading.value
                          ? Container(
                              height: 20,
                              child: Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            )
                          : SizedBox(),
                    ],
                  );
                });
              } else {
                Future.delayed(Duration(seconds: 2), () {
                  print(GetStorage().read("actors"));
                });
                return Center(child: CupertinoActivityIndicator());
              }
            },
            future: controller.getData()));
  }
}

class PopularListView extends StatelessWidget {
  const PopularListView({
    Key? key,
    required this.actors,
  }) : super(key: key);

  final List<ActorsModel>? actors;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardListView(
        children: List.generate(
          actors!.length,
          (index) => ImageCard(
            (actors![index].firstName.toString()),
            actors![index].imageUrl.toString(),
            " ${actors![index].family.toString()}",
            heroTag: (actors![index].id!).toString(),
            person: actors![index],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Squadio ',
          style:
              getMediumTextStyle(color: ColorsManger.darkGrey, fontSize: 22)),
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(AppPadding.padding8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.size8),
          child: CachedNetworkImage(
            imageUrl: "https://i.imgur.com/DvpvklR.png",
            placeholder: (context, string) => CupertinoActivityIndicator(),
            errorWidget: (context, string, object) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SEARCH, arguments: controller.actors);
          },
          child: AppBarActionIcon(icon: CupertinoIcons.search),
        ),
        GestureDetector(
            onTap: () => ThemeService().switchTheme(),
            child: AppBarActionIcon(icon: CupertinoIcons.settings)),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 64);
}

class AppBarActionIcon extends StatelessWidget {
  const AppBarActionIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(AppSize.size8)),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.padding8),
            child: Icon(
              icon,
              color: ColorsManger.darkGrey,
            ),
          ),
        ),
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  CardListView({Key? key, required this.children, this.reversed = false})
      : super(key: key);
  final List<Widget> children;
  final bool reversed;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          itemCount: children.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 2),
            crossAxisSpacing: AppPadding.padding8,
            mainAxisSpacing: AppPadding.padding8,
          ),
          controller: controller.scrollController,
          reverse: reversed,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => FadeInDown(child: children[index]),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final String? heroTag;
  final ActorsModel person;
  ImageCard(this.text, this.imageUrl, this.subtitle,
      {Key? key, required this.heroTag, required this.person})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAILS,
          arguments: {"heroTag": heroTag, "person": person}),
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 10),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.size8),
                  child: heroTag == null
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, string) =>
                              CupertinoActivityIndicator(),
                          errorWidget: (context, string, object) =>
                              Icon(Icons.error),
                          height: 70,
                          fit: BoxFit.cover)
                      : Hero(
                          tag: heroTag.toString(),
                          child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              placeholder: (context, string) =>
                                  CupertinoActivityIndicator(),
                              errorWidget: (context, string, object) =>
                                  Icon(Icons.error),
                              height: 70,
                              fit: BoxFit.cover))),
              Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

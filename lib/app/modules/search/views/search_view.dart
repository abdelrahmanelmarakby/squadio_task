import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:squadio_task/app/modules/home/views/home_view.dart';
import 'package:squadio_task/core/resourses/color_manger.dart';
import 'package:squadio_task/core/resourses/styles_manger.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Squadio ',
            style:
                getMediumTextStyle(color: ColorsManger.darkGrey, fontSize: 22)),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsManger.darkGrey),
        bottom: PreferredSize(
          child: SearchInput(
            searchController: controller.searchController,
            hintText: "Search for any character",
            onChanged: (String search) {
              controller.searchActors(search);
            },
          ),
          preferredSize: Size(double.infinity, 50),
        ),
      ),
      body: controller.actors.isNotEmpty
          ? Obx(() => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: controller.actors.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ImageCard(
                        controller.actors[index].firstName.toString(),
                        controller.actors[index].imageUrl.toString(),
                        controller.actors[index].lastName.toString(),
                        heroTag: (controller.actors[index].id! + 0).toString(),
                        person: controller.actors[index]),
                  );
                },
              ))
          : Center(child: Text("No Data Found")),
    );
  }
}

class SearchInput extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final Function(String) onChanged;
  const SearchInput(
      {required this.searchController,
      required this.hintText,
      Key? key,
      required this.onChanged})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: searchController,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.email),
          prefixIcon:
              const Icon(Icons.search, size: 20, color: Color(0xffFF5A60)),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
      ),
    );
  }
}

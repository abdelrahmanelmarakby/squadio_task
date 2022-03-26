import 'package:get/get.dart';

import 'package:squadio_task/app/modules/details/views/details_view.dart';
import 'package:squadio_task/app/modules/home/views/home_view.dart';
import 'package:squadio_task/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
    ),
  ];
}

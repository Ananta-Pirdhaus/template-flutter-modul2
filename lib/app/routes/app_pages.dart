import 'package:get/get.dart';
import 'package:project/app/modules/home/bindings/home_binding.dart';
import 'package:project/app/modules/home/bindings/profile_binding.dart';
import 'package:project/app/modules/home/views/home_view.dart';
import 'package:project/app/modules/home/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding:
          ProfileBinding(), // Jangan lupa untuk menambahkan binding jika diperlukan
    ),
    // ...
  ];
}

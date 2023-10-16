import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/home_controller.dart';
import 'package:project/app/modules/home/widget/my_appbar.dart';
import 'package:project/app/modules/home/widget/my_bottombar.dart';
import 'package:project/app/modules/home/widget/my_tabbar.dart';
import 'package:project/util/glass_box.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab Anda (Recent, Trending, Top)
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                title: 'Explore Collections',
                onSearchTap: controller.searchButtonTapped,
              ),
              SizedBox(
                height: 600,
                child: MyTabBar(
                  tabOptions: controller.tabOption,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GlassBox(
          child: Obx(() => MyBottomBar(
                index: controller.currentBottomIndex.value,
                onTap: (int index) {
                  controller.handleIndexChanged(index);
                },
              )),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:project/tabs/recent_tab.dart';
import 'package:project/tabs/top_tab.dart';
import 'package:project/tabs/trending_tab.dart';

class HomeController extends GetxController {
  final List<List<dynamic>> tabOption = [
    ["Recent", RecentTab()],
    ["Trending", TrendingTab()],
    ["Top", TopTab()],
  ];

  final RxInt currentBottomIndex = 0.obs;

  void handleIndexChanged(int index) {
    currentBottomIndex.value = index;
  }

  void searchButtonTapped() {
    // Implement logic for search button tap here
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

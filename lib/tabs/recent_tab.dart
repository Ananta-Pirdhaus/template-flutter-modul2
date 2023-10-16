import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/recent_tab_controller.dart';
import 'package:project/app/modules/home/widget/nft_card.dart'; // Impor controller baru

class RecentTab extends StatelessWidget {
  final RecentTabController controller =
      Get.put(RecentTabController()); // Inisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Obx(() => NftCard(
          imagePath:
              controller.imagePath.value, // Gunakan imagePath dari controller
        ));
  }
}

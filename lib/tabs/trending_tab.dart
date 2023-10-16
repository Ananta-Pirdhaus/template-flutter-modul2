import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/trendingtab_controller.dart';
import 'package:project/app/modules/home/widget/nft_card.dart'; // Impor controller baru

class TrendingTab extends StatelessWidget {
  final TrendingTabController controller =
      Get.put(TrendingTabController()); // Inisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Obx(() => NftCard(
          imagePath:
              controller.imagePath.value, // Gunakan imagePath dari controller
        ));
  }
}

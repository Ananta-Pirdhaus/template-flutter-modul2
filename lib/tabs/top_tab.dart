import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/toptab_controller.dart';

import 'package:project/app/modules/home/widget/nft_card.dart'; // Impor controller baru

class TopTab extends StatelessWidget {
  final TopTabController controller =
      Get.put(TopTabController()); // Inisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Obx(() => NftCard(
          imagePath:
              controller.imagePath.value, // Gunakan imagePath dari controller
        ));
  }
}

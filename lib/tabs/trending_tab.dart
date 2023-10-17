import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/trendingtab_controller.dart';

class TrendingTab extends StatelessWidget {
  final TrendingTabController controller = Get.put(TrendingTabController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: controller.getNftList().length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3, // Memberikan bayangan pada card
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    controller.getNftList()[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    controller.getNftList()[index].description,
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    '\$${controller.getNftList()[index].price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Warna harga
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 30, // Ukuran avatar
                    backgroundImage: AssetImage(
                      controller.getNftList()[index].imagePath,
                    ),
                  ),
                  onTap: () {
                    controller.addItemToCart(controller.getNftList()[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

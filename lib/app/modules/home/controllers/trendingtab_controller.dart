// trendingtab_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/data/models/images_models.dart';

class TrendingTabController extends ChangeNotifier {
  List<nftCard> nftShop = [
    nftCard(
      name: "apiens_1",
      price: "236",
      description: "Legend Shoe for your experients",
      imagePath: "lib/images/apiens_1.png",
    ),
    nftCard(
      name: "apiens_2",
      price: "250",
      description: "Walking Shoes for flexin",
      imagePath: "lib/images/apiens_2.png",
    ),
    nftCard(
      name: "apiens_3",
      price: "300",
      description: "Outdoor Running Shoe",
      imagePath: "lib/images/apiens_3.png",
    ),
    nftCard(
      name: "apiens_4",
      price: "300",
      description: "Basket Shoe",
      imagePath: "lib/images/apiens_1.png",
    ),
  ];

  List<nftCard> userCart = [];

  RxString selectedImagePath = ''.obs;
  List<RxString> cartImagePaths = <RxString>[].obs;

  List<nftCard> getNftList() {
    return nftShop;
  }

  void addItemToCart(nftCard nftCard) {
    userCart.add(nftCard);
    cartImagePaths.add(nftCard.imagePath.obs);

    selectedImagePath.value = cartImagePaths.last.value;

    notifyListeners();
  }

  void removeItemFromCart(nftCard nftCard) {
    userCart.remove(nftCard);
    cartImagePaths.remove(nftCard.imagePath);

    if (cartImagePaths.isNotEmpty) {
      selectedImagePath.value = cartImagePaths.last.value;
    } else {
      selectedImagePath.value = '';
    }

    notifyListeners();
  }
}

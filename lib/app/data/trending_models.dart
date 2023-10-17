import 'package:flutter/material.dart';
import 'package:project/app/data/models/images_models.dart';

class trendingModels extends ChangeNotifier {
  // list of shoe for sale
  List<nftCard> nftShop = [
    nftCard(
      name: "apiens_1",
      price: "236",
      description: "Legend Shoe for your experiments",
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

  // list of items in user cart
  List<nftCard> userCart = [];

  // get list of nftCard for sale
  List<nftCard> getNftList() {
    return nftShop;
  }

  // get cart
  List<nftCard> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(nftCard nftCard) {
    userCart.add(nftCard);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(nftCard nftCard) {
    userCart.remove(nftCard);
    notifyListeners();
  }
}

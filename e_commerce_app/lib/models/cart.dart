import 'package:e_commerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: "Nike shoe 1",
        price: "120",
        description: "Shoe description long long long",
        imagePath: 'lib/images/shoe1.png'),
    Shoe(
        name: "Nike shoe 2",
        price: "220",
        description: "Shoe description long long long",
        imagePath: 'lib/images/shoe2.png'),
    Shoe(
        name: "Nike shoe 3",
        price: "120",
        description: "Shoe description long long long",
        imagePath: 'lib/images/shoe3.png'),
    Shoe(
        name: "Nike shoe 4",
        price: "420",
        description: "Shoe description long long long",
        imagePath: 'lib/images/shoe4.png'),
    Shoe(
        name: "Nike shoe 5",
        price: "520",
        description: "Shoe description long long long",
        imagePath: 'lib/images/shoe5.png'),
    Shoe(
        name: "Nike shoe 6",
        price: "120",
        description: "Shoe description long long long",
        imagePath: 'lib/images/shoe6.png'),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

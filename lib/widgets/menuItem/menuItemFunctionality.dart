import 'package:hive/hive.dart';
import 'package:kudos/widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kudos/Constants.dart';

void addToCart(
    {BuildContext context, String name, double price, int qty}) async {
  try {
    Box<Map> cartBox = Hive.box<Map>("cart");

    if (qty > 0) {
      cartBox.put(
        name,
        {'price': price, 'qty': qty},
      );
    }

    snackBar(
        duration: 2,
        context: context,
        text: 'Added to Cart',
        trailingIcon: FaIcon(
          FontAwesomeIcons.shoppingCart,
          color: Color(0xffE6E6E6),
          size: 20,
        ),
        textColor: Color(0xffE6E6E6),
        bgColor: primaryDark);
  } catch (e) {
    snackBar(
        duration: 2,
        context: context,
        text: 'Error',
        trailingIcon: FaIcon(
          FontAwesomeIcons.cross,
          color: Colors.white,
          size: 20,
        ),
        textColor: Colors.white,
        bgColor: Colors.red);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/Cart/cartList.dart';
import 'package:kudos/Screens/Cart/confirmPart.dart';
import 'package:kudos/Screens/Cart/couponPart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Cart',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'cartIcon',
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryLight,
              primaryDark,
            ]),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xfff0f0f0),
        ),
        child: Column(
          children: [
            Expanded(child: couponPart(), flex: 1),
            Expanded(child: CartList(), flex: 6),
            Expanded(child: confirmPart(), flex: 1)
          ],
        ),
      ),
    );
  }
}

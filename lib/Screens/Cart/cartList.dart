import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/Cart/cartListElement.dart';
import 'package:kudos/Screens/Cart/cartStateManagement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CartList extends StatefulWidget {
  const CartList({
    Key key,
  }) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  cartStateClass CS;
  Box<Map> cartBox;

  @override
  void initState() {
    CS = new cartStateClass();
    CS.getUserID(context);
    cartBox = Hive.box<Map>("cart");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff0f0f0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: cartBox.listenable(),
        builder: (context, Box<Map> cart, _) {
          return ListView.separated(
              itemBuilder: (context, index) {
                if (index == cart.keys.toList().length) {
                  return cart.keys.toList().length != 0
                      ? Column(
                          children: [
                            Text(
                              'Discount: 0%',
                              style: TextStyle(
                                color: primaryDark,
                                fontSize: 20,
                              ),
                            ),
                            Observer(
                              builder: (context) {
                                return Text(
                                  'Total: ' + CS.totalCost.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: primaryDark,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                );
                              },
                            ),
                          ],
                        )
                      : Container();
                }
                return cartListItem(
                  itemName: cart.keys.toList()[index],
                  price: cart.get(cart.keys.toList()[index])['price'],
                  qty: cart.get(cart.keys.toList()[index])['qty'],
                  CS: CS,
                );
              },
              separatorBuilder: (_, index) => Divider(),
              itemCount: cart.keys.toList().length + 1);
        },
      ),
    );
  }
}

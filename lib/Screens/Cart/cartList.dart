import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  void initState() {
    CS = new cartStateClass();
    CS.getUserID(context);
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
      child: Observer(builder: (context) {
        return CS.userID.length > 0
            ? StreamBuilder(
                stream: Firestore.instance
                    .collection('users/' + CS.userID + '/cart')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length + 1,
                      itemBuilder: (context, index) {
                        if (index == snapshot.data.documents.length) {
                          return snapshot.data.documents.length!=0? Column(
                            children: [
                              Text(
                                'Discount: 0%',
                                style: TextStyle(
                                  color: primaryDark,
                                  fontSize: 20,
                                ),
                              ),
                              Observer(
                                builder: (context){
                                  return Text(
                                    'Total: '+ CS.totalCost.toStringAsFixed(2),
                                    style: TextStyle(
                                        color: primaryDark,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  );
                                },
                              ),
                            ],
                          ) : Container();
                        }
                        return cartListItem(
                             CS: CS,
                            brandName: snapshot.data.documents[index]['itemName'],
                            qty: snapshot.data.documents[index]['qty'],
                            price: snapshot.data.documents[index]['price']);
                      },
                    );
                  }
                  return Container();
                },
              )
            : Container();
      }),
    );
  }
}

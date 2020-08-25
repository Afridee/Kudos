import 'package:kudos/widgets/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kudos/Constants.dart';

void addToCart({BuildContext context, String name, double price, int qty}) async{

  try{
    final auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    String userID = user.uid;

    final CollectionReference cart = Firestore.instance.collection('users/${userID}/cart');

    if(qty>0){
      await cart.document(name).setData({
        'itemName' : name,
        'price' : price,
        'qty' : qty
      }, merge: true);
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
        bgColor: primaryDark
    );

  }catch(e){
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
        bgColor: Colors.red
    );
  }

}
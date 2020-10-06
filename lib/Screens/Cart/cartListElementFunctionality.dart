import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

bool add(String itemName, int qty, double price){

  try{

    Box<Map> cartBox = Hive.box<Map>("cart");

    cartBox.put(itemName, {
      'qty' : qty + 1,
      'price' : price
    });

//    cartBox.values.forEach((element) {
//      print(element);
//    });
//
//    cartBox.keys.forEach((element) {
//      print(element);
//    });

    return true;
  }catch(e){
    return false;
  }
}

bool remove(String itemName, int qty, double price){

  try{

    Box<Map> cartBox = Hive.box<Map>("cart");

    if(qty==1){
      cartBox.delete(itemName);
    }else{
      cartBox.put(itemName, {
        'qty' : qty - 1,
        'price' : price
      });
    }

    return true;

  }catch(e){
    return false;
  }
}
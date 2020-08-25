import 'package:kudos/Constants.dart';
import 'package:flutter/material.dart';

class couponPart extends StatelessWidget {
  const couponPart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryLight,
              primaryDark,
            ],
          )),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: TextField(
                    //controller: ,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.card_giftcard,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        hintText: "Type coupon code here...",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
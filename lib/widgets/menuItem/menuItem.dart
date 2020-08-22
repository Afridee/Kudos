import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kudos/Animation/FadeAnimation.dart';
import 'package:kudos/Constants.dart';
import 'package:kudos/widgets/menuItem/menuItemState.dart';

class menuItem extends StatefulWidget {
  final String img;
  final String itemName;
  final price;
  final String desc;

  const menuItem({
    Key key,
    this.img,
    this.itemName,
    this.price,
    this.desc,
  }) : super(key: key);

  @override
  _menuItemState createState() => _menuItemState();
}

class _menuItemState extends State<menuItem> {
  @override
  Widget build(BuildContext context) {
    //State Management for list Item:
    listStateClass MS = new listStateClass();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            primaryLight,
            primaryDark,
          ]),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: widget.img,
                placeholder: (context, url) => Container(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: primaryDark,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 210,
                      child: AutoSizeText(widget.itemName,
                          style: TextStyle(
                            color: Color(0xffE6E6E6),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      width: 210,
                      child: AutoSizeText(widget.desc,
                          style: TextStyle(
                            color: Color(0xffE6E6E6),
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
                Text(
                  "৳" + widget.price.toString(),
                  style: TextStyle(
                      color: Color(0xffE6E6E6),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  color: Color(0xffE6E6E6),
                  iconSize: 30,
                  onPressed: () {
                    MS.deduct();
                  },
                ),
                Observer(builder: (context) {
                  return Text(
                    MS.qty.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffE6E6E6),
                    ),
                  );
                }),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Color(0xffE6E6E6),
                  iconSize: 30,
                  onPressed: () {
                    MS.add();
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Color(0xffE6E6E6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: primaryDark),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

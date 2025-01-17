import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/Cart/Cart.dart';
import 'package:kudos/Screens/homeStateManagement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kudos/widgets/drawer.dart';
import 'package:kudos/widgets/menuItem/menuItem.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  homeStateClass HS;

  @override
  void initState() {
    HS = new homeStateClass();
    HS.setTitlse(1);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //this little code down here turns off auto rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          appBar: AppBar(
              title: Observer(builder: (context) {
                return HS.search_text;
              }),
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
              actions: <Widget>[
                Observer(builder: (context) {
                  return IconButton(
                    icon: Hero(
                      tag: 'searchIcon',
                      child: HS.custom_Icon,
                    ),
                    onPressed: () {
                      HS.seacrchIconState();
                    },
                  );
                }),
                IconButton(
                  icon: Hero(
                    tag: 'cartIcon',
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new Cart(),
                    );
                    Navigator.of(context).push(route);
                  },
                )
              ],
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 6.0,
                onTap: (index) {
                  HS.setCategory(index);
                },
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      child: Text(
                        'Burgers',
                        style:
                            TextStyle(color: Color(0xffE6E6E6), fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Sandwiches',
                        style:
                            TextStyle(color: Color(0xffE6E6E6), fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Snacks',
                        style:
                            TextStyle(color: Color(0xffE6E6E6), fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Drinks',
                        style:
                            TextStyle(color: Color(0xffE6E6E6), fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Add-ons',
                        style:
                            TextStyle(color: Color(0xffE6E6E6), fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              )),
          drawer: mainDrawer(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/loginScreenBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Observer(
              builder: (context) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                            .collection('Menu')
                            .where('category', isEqualTo: HS.category)
                            .snapshots(),
                    builder: (context, snapshot) {
                      return snapshot.hasData && snapshot.data != null
                          ? ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                print(snapshot.data.documents.length);
                                return Observer(builder: (context) {
                                  return  snapshot.data.documents[index].get('itemName')
                                          .toString()
                                          .trim()
                                          .toLowerCase()
                                          .contains(HS.searchQuery
                                              .trim()
                                              .toLowerCase())
                                      ? menuItem(
                                          img: snapshot.data.documents[index].get('img'),
                                          itemName: snapshot.data.documents[index].get('itemName'),
                                          desc: snapshot.data.documents[index].get('desc'),
                                          price: snapshot.data.documents[index].get('price'),
                                        )
                                      : Container();
                                });
                              })
                          : Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  backgroundColor: primaryDark,
                                ),
                              ),
                            );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}

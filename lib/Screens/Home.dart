import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kudos/Constants.dart';
import 'package:kudos/Screens/homeStateManagement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kudos/Screens/loginPages/loginFunctionalities.dart';
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
              title: Text(
                HS.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
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
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    signOut(context);
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
          drawer: Drawer(
            elevation: 0.0,
            child: Container(
              decoration: BoxDecoration(color: primaryDark),
            ),
          ),
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
                    stream: Firestore.instance
                        .collection('Menu')
                        .where('category', isEqualTo: HS.category)
                        .snapshots(),
                    builder: (context, snapshot) {
                      return snapshot.hasData && snapshot.data != null
                          ? ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return menuItem(
                                  img: snapshot.data.documents[index]['img'],
                                  itemName: snapshot.data.documents[index]['itemName'],
                                  desc: snapshot.data.documents[index]['desc'],
                                  price: snapshot.data.documents[index]['price'],
                                );
                              })
                          : Container(
                           child: Center(
                           child: CircularProgressIndicator(
                             valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
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



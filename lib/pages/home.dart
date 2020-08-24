import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// my own imports
import 'package:shop_app/components/horizental_listview.dart';
import 'package:shop_app/components/product.dart';
import 'package:shop_app/pages/carts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("lib/images/c1.jpg"),
          AssetImage("lib/images/m1.jpeg"),
          AssetImage("lib/images/m2.jpg"),
          AssetImage("lib/images/w1.jpeg"),
          AssetImage("lib/images/w3.jpeg"),
          AssetImage("lib/images/w4.jpeg"),
        ],
        autoplay: true,
        dotSize: 4.0,
        dotColor: Colors.red,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 2.0,

        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(microseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text("Shop App"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new carts()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text("Taher Zidane"),
              accountEmail: Text("zidan202066@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.red),
            ),
            // BODY
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new carts()));
              },
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About US"),
                leading: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          // image carousel begins here
          imageCarousel,
          // paading widget
          new Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          // horizental list view begins here
          HorizentalList(),

          // paading widget
          new Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "Recent Products",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          // gried view
          // Container(
          //   height: 320.0,
          //   child: product(),
          // )
          Flexible(child: product()),
        ],
      ),
    );
  }
}

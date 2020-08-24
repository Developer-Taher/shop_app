import 'package:flutter/material.dart';

// =======================================================my import 
import 'package:shop_app/components/cart_product.dart';


class carts extends StatefulWidget {
  @override
  _cartsState createState() => _cartsState();
}

class _cartsState extends State<carts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text("Cart"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => new carts()));
              })
        ],
      ),
      body: new cardProducts(),




      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total Salary X"),
              subtitle: new Text("\$00.0"),
            )),
            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text("Check Out", style: TextStyle(color: Colors.white),),
              color: Colors.red,
              ),
              )
          ],
        ),
      ),



    );
  }
}

// import 'dart:js';

import 'package:flutter/material.dart';

class cardProducts extends StatefulWidget {
  @override
  _cardProductsState createState() => _cardProductsState();
}

class _cardProductsState extends State<cardProducts> {
  var products_on_the_cart = [
    {
      "name": "Blazer1",
      "picture": "lib/images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Dress1",
      "picture": "lib/images/products/dress1.jpeg",
      "price": 81,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Blazer2",
      "picture": "lib/images/products/blazer2.jpeg",
      "price": 98,
      "size": "M",
      "color": "white",
      "quantity": 1,
    },
    {
      "name": "Dress2",
      "picture": "lib/images/products/dress2.jpeg",
      "price": 45,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Hills",
      "picture": "lib/images/products/hills1.jpeg",
      "price": 90,
      "size": "M",
      "color": "Brown",
      "quantity": 1,
    },
    {
      "name": "Hills2",
      "picture": "lib/images/products/hills2.jpeg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Pants",
      "picture": "lib/images/products/pants1.jpg",
      "price": 77,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Pants2",
      "picture": "lib/images/products/pants2.jpeg",
      "price": 97,
      "size": "M",
      "color": "grey",
      "quantity": 1,
    },
    {
      "name": "Shoe",
      "picture": "lib/images/products/shoe1.jpg",
      "price": 78,
      "size": "M",
      "color": "Stell",
      "quantity": 1,
    },
    {
      "name": "Skert",
      "picture": "lib/images/products/skt1.jpeg",
      "price": 64,
      "size": "M",
      "color": "Rose",
      "quantity": 1,
    },
    {
      "name": "Skert1",
      "picture": "lib/images/products/skt2.jpeg",
      "price": 80,
      "size": "M",
      "color": "Pink",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_the_cart.length,
        itemBuilder: (context, index) {
          return sigle_cart_product(
            cart_prod_name: products_on_the_cart[index]["name"],
            cart_prod_color: products_on_the_cart[index]["color"],
            cart_prod_price: products_on_the_cart[index]["price"],
            cart_prod_picture: products_on_the_cart[index]["picture"],
            cart_prod_size: products_on_the_cart[index]["size"],
            cart_prod_qty: products_on_the_cart[index]["quantity"],
          );
        });
  }
}

class sigle_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;
  sigle_cart_product(
      {this.cart_prod_name,
      this.cart_prod_color,
      this.cart_prod_price,
      this.cart_prod_picture,
      this.cart_prod_qty,
      this.cart_prod_size});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          // ============== leading section for carts  ==============
          leading: new Image.asset(
            cart_prod_picture,
            width: 60.0,
            height: 60.0,
          ),
          // ============== title section  ==========
          title: new Text(cart_prod_name),
          // ============== sup title section =========
          subtitle: new Column(
            children: <Widget>[
              // ========== take care here its your row inside the column for cart screen
              new Row(
                children: <Widget>[
                  // ================== this section is for the size on carts screen
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text("Size: "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_size,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  // =============== this section is for product color =========
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 4.0, 4.0, 4.0),
                    child: new Text("Color: "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_color,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              // =================== this section is for product price
              new Container(
                alignment: Alignment.topLeft,
                child: new Text(
                  "\$${cart_prod_price}",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          // dont forget here its your A RenderFlex overflowed by 40 pixels on the bottom.
          // and you solve it remember this solution
          trailing: FittedBox(
            fit: BoxFit.fill,
            child: Column(
              children: <Widget>[
                // =====dont forget to repaer your keys and make the quantity widget
                new IconButton(
                    icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
                new Text("${cart_prod_qty}"),
                new IconButton(
                    icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
              ],
            ),
          )),
    );
  }
  // void addQuantity(){
  //   cart_prod_qty = cart_prod_qty + 1;
  // }
}

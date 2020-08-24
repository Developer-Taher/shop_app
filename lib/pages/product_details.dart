// import 'dart:js';
// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/pages/carts.dart';

import 'home.dart';

class productDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail__picture;

  productDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail__picture});

  @override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new Homepage()));
            },
            child: Text("Product Details")),
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
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail__picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_new_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),

          //================================================ the first button ++++++++++++++===================
          Row(
            children: <Widget>[
              //=========================================== the size button ===========================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("Choose The Size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  var pop = Navigator.of(context).pop(context);
                                },
                                child: new Text(
                                  "Close",
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white70,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              // ================================the Color button ===========================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Choose The Color"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  var pop = Navigator.of(context).pop(context);
                                },
                                child: new Text(
                                  "Close",
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white70,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              // =====================================the Quantity button ===========================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose The Quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  var pop = Navigator.of(context).pop(context);
                                },
                                child: new Text(
                                  "Close",
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white70,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              )
            ],
          ),

          //========================== the second button ++++++++++++++===================
          Row(
            children: <Widget>[
              //=========================================== the size button ===========================
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy Now")),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            ),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name),
              )
            ],
          ),
          // =====================================================remember to create the prand
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("zara"),
              )
            ],
          ),
          // =====================================================remember to create the product condation
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Used"),
              )
            ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar Product"),
          ),
          // similer single product sictions from  the main screen
          Container(
            height: 450.0,
            child: similarProducts(),
          )
        ],
      ),
    );
  }
}

class similarProducts extends StatefulWidget {
  @override
  _similarProductsState createState() => _similarProductsState();
}

class _similarProductsState extends State<similarProducts> {
  var product_list = [
    {
      "name": "Pants",
      "picture": "lib/images/products/pants1.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Skert",
      "picture": "lib/images/products/skt1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Pants2",
      "picture": "lib/images/products/pants2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Shoe",
      "picture": "lib/images/products/shoe1.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Skert1",
      "picture": "lib/images/products/skt2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Blazer1",
      "picture": "lib/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Dress1",
      "picture": "lib/images/products/dress1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Blazer2",
      "picture": "lib/images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Dress2",
      "picture": "lib/images/products/dress2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Hills",
      "picture": "lib/images/products/hills1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Hills2",
      "picture": "lib/images/products/hills2.jpeg",
      "old_price": 120,
      "price": 85,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Similar_Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 2"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  // here we are passing value of product to product details page
                  builder: (context) => new productDetails(
                        product_detail_name: prod_name,
                        product_detail__picture: prod_picture,
                        product_detail_new_price: prod_price,
                        product_detail_old_price: prod_old_price,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              prod_name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          new Text(
                            "\$${prod_price}",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/product/price_tag.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageURL;
  final double price;
  final String description;
  ProductPage(this.title, this.imageURL, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(imageURL),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          title,
                          style:
                              TextStyle(fontFamily: 'Oswald', fontSize: 30.0),
                        )),
                  PriceTag(price.toString()), 
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                  ),
              ]),
        ));
  }
}

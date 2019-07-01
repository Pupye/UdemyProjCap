import 'package:flutter/material.dart';
import './product_card.dart';
//products widget, costructed by taking list of strings
//which then mapped to cards with same asset.
//We get iterable and then change iterable into list
//because children accepts only list of widgets

class Products extends StatelessWidget {
  final List<Map> products;
  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (context, int index) => ProductCard(products[index], index),
            itemCount: products.length,
          )
        : Center(
            child: Text('no products please add some'),
          ); //you can also do if check or
    //batch everything in a separate function like above remeber fund concept. keep clean.
  }
}

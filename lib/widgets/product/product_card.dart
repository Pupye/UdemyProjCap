import 'package:flutter/material.dart';
import 'package:hello_world/widgets/product/address_tag.dart';
import 'package:hello_world/widgets/product/price_tag.dart';
import 'package:hello_world/widgets/ui_elements/title_default.dart';


class ProductCard extends StatelessWidget{
  final Map product;
  final int productIndex; 

  ProductCard(this.product, this.productIndex);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(product['image'])),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TitleDefault(product['title']),
                  SizedBox(
                    width: 10.0,
                  ),
                  PriceTag(product['price'].toString())
                ],
              )),
          AddressTag('some address'),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/products/' + productIndex.toString())),
            IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.red,
              onPressed: () {},
            )
          ]),
        ],
      ),
    );
  }
}
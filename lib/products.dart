import 'package:flutter/material.dart';

//products widget, costructed by taking list of strings
//which then mapped to cards with same asset.
//We get iterable and then change iterable into list
//because children accepts only list of widgets

class Products extends StatelessWidget {
  final List<Map> products;
  final Function deleteProduct;
  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(products[index]['title']),
          ),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              child: Text('Details'),
              onPressed: () => Navigator.pushNamed<bool>(context, '/products/'+index.toString()).then((bool value) {
                    if (value) {
                      deleteProduct(index);
                    }
                  }),
            ),
          ]),
        ],
      ),
    );
  }
  // Widget _buildProductList(){
  //   Widget productCard;
  //   if(products.length > 0){
  //     productCard = ListView.builder(
  //     itemBuilder: _buildProductItem,
  //     itemCount: products.length,
  //   );
  //   }else{
  //     productCard = Center(child: Text('no products please add some'),); //if you do not need text
  //you can retrun empty container
  //   }
  //   return productCard;
  // }

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: products.length,
          )
        : Center(
            child: Text('no products please add some'),
          ); //you can also do if check or
    //batch everything in a separate function like above remeber fund concept. keep clean.
  }
}

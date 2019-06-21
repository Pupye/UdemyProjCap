import 'package:flutter/material.dart';

//products widget, costructed by taking list of strings
//which then mapped to cards with same asset.
//We get iterable and then change iterable into list
//because children accepts only list of widgets

class Products extends StatelessWidget {
  final List<Map> products;
  Products(this.products);

  Widget _buildProductItem(context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(products[index]['image'])),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products[index]['title'],
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      '\$ ${products[index]['price'].toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/products/' + index.toString())),
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

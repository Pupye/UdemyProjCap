import 'package:flutter/material.dart';

import 'package:hello_world/products.dart';
import 'product_control.dart';

//connecting widget connects button(product controll) with text
class ProductManager extends StatelessWidget {
  final List<Map> products;
  final Function addProduct; 
  final Function deleteProduct; 

  ProductManager(this.products, this.addProduct, this.deleteProduct); 

   //this field is unique and
  //instantiated when object created
  //can be final
  //final keyworld gives opportunity to call methods and object can ubdergo changes
  //whereas written in the right side const do not give such ability objects with const are for external use and immutable

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.startingProduct != null) {
  //     _products.add(widget.startingProduct);
  //   } //widget is provided by state object
  //   //gives access to the connected stateful object
  // }


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(
            addProduct), //passing down a refernce to a function that
        // executes in parent. like javaScript closure
      ),
      Expanded(child: Products(products, deleteProduct: deleteProduct))
    ]);
  }
}

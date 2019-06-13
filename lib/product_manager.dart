import 'package:flutter/material.dart';

import 'package:hello_world/products.dart';
import 'product_control.dart';

//connecting widget connects button(product controll) with text
class ProductManager extends StatefulWidget {
  final Map startingProduct;

  ProductManager(
      {this.startingProduct}); //positional argument is always optional
  // this is optional argument also can be setted to positional

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map> _products = []; //this field is unique and
  //instantiated when object created
  //can be final
  //final keyworld gives opportunity to call methods and object can ubdergo changes
  //whereas written in the right side const do not give such ability objects with const are for external use and immutable

  @override
  void initState() {
    super.initState();
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    } //widget is provided by state object
    //gives access to the connected stateful object
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _addProducts(Map product) {
    setState(() {
      _products.add(product);
      // does not touces the reference (the object is same)
      //the only thing that changes is list it is a same list(object)
      //just with new element
      //calling method is okay.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(
            _addProducts), //passing down a refernce to a function that
        // executes in parent. like javaScript closure
      ),
      Expanded(child: Products(_products, deleteProduct: _deleteProduct))
    ]);
  }
}

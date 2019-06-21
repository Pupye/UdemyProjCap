import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:hello_world/pages/auth.dart';
import 'package:hello_world/pages/products.dart';
import './pages/product.dart';
import './pages/admin_product.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map> _products = [];

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
    return MaterialApp(
      theme: ThemeData(
         
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      home: AuthPage(),
      routes: {
        '/products': (context) => ProductsPage(_products),
        '/admin': (context) => AdminProduct(_addProducts, _deleteProduct)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'products') {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            // it is included because we may need animation
            //thats why additinal widget
            builder: (context) => ProductPage(_products[index]['title'],
                _products[index]['image']), //you always use the constructor
            //to pass data between widgets
          );
        }
        return null; 
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (context) =>
                ProductsPage(_products));
      },
    ); //here we use named arguments
  }
}

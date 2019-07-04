import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function _addProduct;

  ProductCreatePage(this._addProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;

  _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Name of the product'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  _buildDescriptionTextField() {
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(labelText: 'Describe the product'),
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  _buildPriceField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Price',
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  _submitForm() {
    widget._addProduct({
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/zhoka.jpg',
    });
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceField(),
          SizedBox(
            height: 10.0,
          ),
          MaterialButton(
            onPressed: _submitForm,
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}

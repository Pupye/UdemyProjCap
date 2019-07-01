import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String _address;
  
  AddressTag(this._address);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          // borderRadius: BorderRadius.circular(4.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
          child: Text(_address),
        ));
  }
}

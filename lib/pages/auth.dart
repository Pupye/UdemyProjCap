import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}


class _AuthPageState extends State <AuthPage>{
  bool _acceptTerms = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Authorization'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SwitchListTile(
                  title: Text('Accept terms'),
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value; 
                    });
                  },
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  },
                ),
              ]),
        ));
  }
}

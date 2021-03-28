import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Username',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                validator: (String value) {
                  return (value != null && value.length >= 8)
                      ? 'Your password must be 8 character long '
                      : null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    print('pressed');
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}

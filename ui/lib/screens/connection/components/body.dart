import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/screens/connection/components/connection_form.dart';

class Body extends StatelessWidget {
  bool isRemembered = true;
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
                  return (value.isEmpty || !value.contains('@'))
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
                  return (value.isEmpty || value.length < 8)
                      ? 'Your password must be 8 character long'
                      : null;
                },
              ),
              Consumer<ConnectionFormProvider>(builder: (_, provider, __) {
                isRemembered = provider.newValue;
                return ConnectionForm();
              }),
              ElevatedButton(
                  onPressed: () {
                    print('pressed $isRemembered');
                    //how to get data from checkbox
                  },
                  child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

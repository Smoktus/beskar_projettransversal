import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/employe/accueil/employe_accueil.dart';

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
                      ? 'Your email must contain @ '
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
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () =>
                    {Navigator.pushNamed(context, EmployeAccueil.routeName)},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: kIconSelectedColor,
                    elevation: 3,
                    minimumSize: Size(200,50),
                  ),
                  child: Text('Submit', style: TextStyle(fontFamily: "Proxima Nova", fontWeight: FontWeight.bold, fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final width = mediaQueryData.size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropDownList(),
        Row(
          children: [
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.person),
                  labelText: 'Nom',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.bluetooth_audio),
                  labelText: 'Prénom',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
          ],
        ),
        SizedBox(),
        Row(
          children: [
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.mail),
                  labelText: 'Mail',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.atm),
                  labelText: 'Password',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
          ],
        ),
        SizedBox(),
        Row(
          children: [
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.sports_cricket_sharp),
                  labelText: 'Ville',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.mail),
                  labelText: 'Code Postale',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
          ],
        ),
        SizedBox(),
        Row(
          children: [
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.mail),
                  labelText: 'Adresse',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
            Container(
              width: width / 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.mail),
                  labelText: 'Numéro de Siret',
                ),
                validator: (String value) {
                  return (value != null && !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
            ),
          ],
        ),
        ElevatedButton(onPressed: () => {}, child: Text("Envoyer"))
      ],
    );
  }
}

class DropDownList extends StatefulWidget {
  @override
  _DropDownList createState() => _DropDownList();
}

class _DropDownList extends State<DropDownList> {
  String dropdownValue = 'Employe';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Employe', 'Employeur', 'Commercant']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

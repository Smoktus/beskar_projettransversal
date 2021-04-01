import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectionFormProvider with ChangeNotifier {
  bool _newValue;

  bool get newValue => _newValue;

  void setValueChecked(bool v) {
    _newValue = v;
    notifyListeners();
  }
}

class ConnectionForm extends StatefulWidget {
  @override
  _ConnectionForm createState() => _ConnectionForm();
}

class _ConnectionForm extends State<ConnectionForm> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ConnectionFormProvider>(
        builder: (_, provider, __) {
          //child:
          return CheckboxListTile(
            title: Text("Se rappeler de moi ?"),
            value: checkedValue,
            activeColor: Colors.cyan,
            onChanged: (newValue) {
              checkedValue = newValue;
              provider.setValueChecked(checkedValue);
              /*setState(() {
                checkedValue = newValue;
                //print(checkedValue);
                
              });*/
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          );
        },
      ),
    );
  }
}

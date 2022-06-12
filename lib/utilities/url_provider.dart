import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlProvider {

  UrlProvider._privateConstructor();

  static final UrlProvider _instance = UrlProvider._privateConstructor();

  factory UrlProvider() {
    return _instance;
  }

  static String? baseURL = "http://95.177.174.255:7165";


  setUrlByUser(val)
  {
    if(val==1)
    {
      baseURL = "https://baseurl_1";
    }
    else if(val==2)
    {
      baseURL = "https://baseurl_2";
    }

    else if(val==3)
    {
      baseURL= "https://baseurl_3";
    }
  }

  static getEmployees() {
    return "https://dummy.restapiexample.com/api/v1/employees";
  }

  static getUserStatusByMobileNumber(){
    return "$baseURL/api/UserContext/GetUserByMobile";
  }
  static authenticateUserWithPin(){
    return "$baseURL/api/UserContext/authenticate";
  }


}



class RadioButtonAlertDialog extends StatefulWidget {
  @override
  RadioButtonAlertDialogState createState() {
    return new RadioButtonAlertDialogState();
  }
}

class RadioButtonAlertDialogState extends State<RadioButtonAlertDialog> {

  late UrlProvider urlProvider;
  int? selectedRadio;

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    urlProvider = new UrlProvider();
    initSelectedRadio();
  }

  initSelectedRadio() async
  {
    final SharedPreferences prefs = await preferences;
    int? value = prefs.getInt("url");
    if (value == null) {
      setState(() {
        selectedRadio = 1;
        prefs.setInt("url", selectedRadio!);
        selectedRadio = prefs.getInt("url");
      });
    }
    else {
      setSelectedRadio(value);
    }
  }

  void setSelectedRadio(int? value) {
    setState(() {
      selectedRadio = value;
    });
    print(selectedRadio);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Base Url Switcher',style: TextStyle(fontSize: 18.0),),
      content: Container(
        child: Wrap(
          children: <Widget>[
            RadioListTile(title: Text('https://baseurl_1'),
                value: 1,
                activeColor: Colors.amber,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setSelectedRadio(value);
                }),
            RadioListTile(title: Text('https://baseurl_2'),
                value: 2,
                activeColor: Colors.amber,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setSelectedRadio(value);
                }),
            RadioListTile(title: Text('https://baseurl_3'),
                value: 3,
                activeColor: Colors.amber,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setSelectedRadio(value);
                }),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0)
                ),
                width: 1000,
                child: RaisedButton(onPressed: () async
                    {
                      final SharedPreferences prefs = await preferences;
                      prefs.setInt("url", selectedRadio!);
                      selectedRadio = prefs.getInt("url");
                      urlProvider.setUrlByUser(selectedRadio);
                      Navigator.pop(context);
                    },
                    child: new Text(
                      'Select', style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Cancel',style: TextStyle(),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

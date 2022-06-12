import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetSharedPreferenceData{
  saveValue(String key,int value) async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("saved value $value");
    sharedPreferences.setInt(key, value);
  }

  saveDataToSharedPreferences(String key,String value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("saved value $value");
    sharedPreferences.setString(key, value);
  }

  Future<String> getDataFromSharedPreferences(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key) as String;
  }

  getValue(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key);
  }

  deleteValue(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(key);
  }
}
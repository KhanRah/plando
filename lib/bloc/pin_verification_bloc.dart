
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plando/bloc/base_bloc.dart';
import 'package:plando/modals/user_data_modal.dart';
import 'package:plando/utilities/http_manager.dart';
import 'package:plando/utilities/route_names.dart';
import 'package:plando/utilities/shared_prefrences.dart';
import 'package:plando/utilities/url_provider.dart';

class PinVerificationBloc implements BaseBloc{

  static final PinVerificationBloc _pinVerificationBloc = PinVerificationBloc.internal();

  PinVerificationBloc.internal();

  factory PinVerificationBloc() => _pinVerificationBloc;

  TextEditingController? pinController;

  @override
  void dispose() {
    pinController!.dispose();
  }

  @override
  void init() {
    pinController = TextEditingController();
  }


  authenticateUser(BuildContext context,String mobileNumber) async{
    Map<String,dynamic> postParams =  {
      "mobileNumber":int.parse(mobileNumber),
      "pin":int.parse(pinController!.text)
    };
    var response = await HttpManager().postMethodCall(UrlProvider.authenticateUserWithPin(),postParams);
    debugPrint("$response");
    if(response["isSuccess"] == true){
      GetSharedPreferenceData().saveDataToSharedPreferences("userData", jsonEncode(response['results'][0]));
      String userData = await GetSharedPreferenceData().getDataFromSharedPreferences("userData");
      UserDataModal user = userDataModalFromMap(userData);
      debugPrint(user.token);
      Navigator.of(context).pushNamedAndRemoveUntil(PathName.userChoosingView, (Route<dynamic> route) => false);
    }else{

    }
  }

}
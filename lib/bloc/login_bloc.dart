
import 'package:flutter/material.dart';
import 'package:plando/bloc/base_bloc.dart';
import 'package:plando/utilities/http_manager.dart';
import 'package:plando/utilities/route_names.dart';
import 'package:plando/utilities/url_provider.dart';
import 'package:snack/snack.dart';

class LoginBloc implements BaseBloc{

  static final LoginBloc _loginBloc = new LoginBloc.internal();

  LoginBloc.internal();

  factory LoginBloc() => _loginBloc;

  TextEditingController? phoneNumber;

  @override
  void dispose() {
    phoneNumber!.dispose();
  }

  @override
  void init() {
    phoneNumber = TextEditingController();
  }

  final bar = const SnackBar(content: Text('User not found with the given Mobile Number!'));

  SnackBar showSnackBar(String message){
    return SnackBar(content: Text(message));
  }

  getUserStatus(BuildContext context) async {
    Map<String,dynamic> qpm =  {
      "mobileNumber":int.parse(phoneNumber!.text)
    };
   try{
     var response = await HttpManager().getMethodCall(UrlProvider.getUserStatusByMobileNumber(),qpm);
     if(response["isSuccess"] == true){
       if(response["isVerified"] == true) {
         Navigator.pushNamed(context, PathName.pinVerificationView,arguments: phoneNumber!.text);
       } else{
         Navigator.pushNamed(context, PathName.otpView,arguments: phoneNumber!.text);
       }
     }else{
       bar.show(context);
       debugPrint("not user");
     }
     debugPrint("$response");
   }catch(e){
     showSnackBar("Something went wrong, Please try again later").show(context);
   }
  }

}
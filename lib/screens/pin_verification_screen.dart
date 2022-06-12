import 'package:plando/bloc/login_bloc.dart';
import 'package:plando/bloc/pin_verification_bloc.dart';
import 'package:plando/utilities/formFields.dart';
import 'package:flutter/material.dart';
import 'package:plando/utilities/route_names.dart';


class PinVerificationScreen extends StatefulWidget {
  final String mobileNumber;
  const PinVerificationScreen({Key? key,required this.mobileNumber}) : super(key: key);

  @override
  _PinVerificationScreenState createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  final _formKey = GlobalKey<FormState>();
  late PinVerificationBloc _pinVerificationBloc;

  @override
  void initState() {
    super.initState();
    _pinVerificationBloc  = PinVerificationBloc();
    _pinVerificationBloc.init();
  }

  @override
  void dispose() {
    _pinVerificationBloc.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final double height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                child:const Center(child: Text("PLANDO",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 56.0,letterSpacing: 8.0),)),
                decoration:const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.blueAccent
                    ])
                ),
                height: height - height/2,
              ),
              SizedBox(
                height: height/4,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 24.0),
                child: Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "Enter your pin",),
                      TextSpan(text: " *",style: TextStyle(color: Color(0xffDB5B46)))
                    ]
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FormFields.getFormField(keyboardType: const TextInputType.numberWithOptions(),formFieldController: _pinVerificationBloc.pinController,context: context,hintText: 'Pin Number',obscureText: false,onChanged:(_){setState(() {});},maxLines: 1,textCapitalization: TextCapitalization.none,editingComplete: (){ debugPrint("Its Called") ;node.nextFocus();},validator: (pin){
                  if(pin == null||pin.isEmpty){
                    return "Please enter valid pin number";
                  } else {
                    return null;
                  }
                }),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12.0),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      node.unfocus();
                      _pinVerificationBloc.authenticateUser(context,widget.mobileNumber);
                    }else{
                    }

                  },child: const Text("Confirm"),style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: const Size(1000.0,48.0)),),
                ),
              )
            ],
          ),
        )
    );
  }
}
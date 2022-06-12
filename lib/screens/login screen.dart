import 'package:flutter/cupertino.dart';
import 'package:plando/bloc/login_bloc.dart';
import 'package:plando/utilities/formFields.dart';
import 'package:flutter/material.dart';
import 'package:plando/utilities/route_names.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    _loginBloc.init();

  }

  final _formKey = GlobalKey<FormState>();

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
                      TextSpan(text: "Mobile Number",),
                      TextSpan(text: " *",style: TextStyle(color: Color(0xffDB5B46)))
                    ]
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FormFields.getFormField(keyboardType: TextInputType.phone,formFieldController: _loginBloc.phoneNumber,context: context,hintText: 'Mobile Number',obscureText: false,onChanged:(_){setState(() {});},maxLines: 1,textCapitalization: TextCapitalization.none,editingComplete: (){ debugPrint("Its Called") ;node.nextFocus();},validator: (phoneNumber){
                  if(phoneNumber == null||phoneNumber.isEmpty){
                    return "Please enter Mobile Number";
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
                      _loginBloc.getUserStatus(context);
                    }else{
                    }
                  },child: const Text("Login"),style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: const Size(1000.0,48.0)),),
                ),
              )
            ],
          ),
        )
    );
  }
}



class BezierClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 950;
    final double _yScaling = size.height / 896;
    path.lineTo(563.505 * _xScaling,212.5 * _yScaling);
    path.cubicTo(261.505 * _xScaling,248.5 * _yScaling,259.505 * _xScaling,450.5 * _yScaling,204.005 * _xScaling,561.5 * _yScaling,);
    path.cubicTo(169.846 * _xScaling,629.819 * _yScaling,70.6973 * _xScaling,687.128 * _yScaling,0.753906 * _xScaling,720.859 * _yScaling,);
    path.cubicTo(0.753906 * _xScaling,720.859 * _yScaling,0.753906 * _xScaling,0 * _yScaling,0.753906 * _xScaling,0 * _yScaling,);
    path.cubicTo(0.753906 * _xScaling,0 * _yScaling,948.505 * _xScaling,0 * _yScaling,948.505 * _xScaling,0 * _yScaling,);
    path.cubicTo(920.839 * _xScaling,58.8333 * _yScaling,805.105 * _xScaling,183.7 * _yScaling,563.505 * _xScaling,212.5 * _yScaling,);
    path.cubicTo(563.505 * _xScaling,212.5 * _yScaling,563.505 * _xScaling,212.5 * _yScaling,563.505 * _xScaling,212.5 * _yScaling,);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

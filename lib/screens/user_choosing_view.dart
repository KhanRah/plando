import 'package:flutter/material.dart';
import 'package:plando/utilities/route_names.dart';


class UserChooseCompanyView extends StatefulWidget {
  const UserChooseCompanyView({Key? key}) : super(key: key);

  @override
  _UserChooseCompanyViewState createState() => _UserChooseCompanyViewState();
}

class _UserChooseCompanyViewState extends State<UserChooseCompanyView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
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
            height: height/12,
          ),
          const Text("Select your account",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
                errorStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.red),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Color(0xFFF2F3F7),style: BorderStyle.solid,width: 1.0),),
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.red,style: BorderStyle.none,),),
                contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                filled: true,
                fillColor: Color(0xFFF2F3F7),
              ),
              hint: const Text("Please choose one"),
              items: <String>['Company A','Company B'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, PathName.homeScreen);
              },child: const Text("Select"),style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: const Size(1000.0,48.0)),),
            ),
          )
        ],
      ),
    );
  }
}

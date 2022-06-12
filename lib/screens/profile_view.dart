import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {

  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
          const CircleAvatar(child: Icon(Icons.person),radius: 58.0),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          const Text("Testing User",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700),textAlign: TextAlign.center),
          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),

          Container(height: 0.5,color: const Color(0xffEBEFF2),),
          settingTile("Help", "Know about app, service, FAQ and more", (){}),
          Container(height: 0.5,color: const Color(0xffEBEFF2),),
          settingTile("Version.", "0.0.1", (){}),
          Container(height: 0.5,color: const Color(0xffEBEFF2),),
          settingTile("Log Out", "Log Out from App", () {}),
        ],
      ),
    );
  }
  Widget settingTile(
      String headerText, String subText, Function onTap) {
    return ListTile(
      onTap: onTap as void Function()?,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
      trailing: const Icon(Icons.chevron_right),
      tileColor: const Color(0xffF8F9F9),
      dense: true,
      title: Text(headerText,style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 16.0),),
      subtitle: Text(subText,style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 12.0),),
    );
  }

}

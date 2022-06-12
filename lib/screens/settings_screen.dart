import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color(0xFFF0EDFD),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SettingTile("Profile", "Check Profile", (){},Icons.person),
          ),
          Container(height: 0.5,color: Color(0xffEBEFF2),),
          SettingTile("Notifications", "Manage Notifications", (){},Icons.notifications),
          Container(height: 0.5,color: Color(0xffEBEFF2),),
          SettingTile("Logout", "Logout from app", (){},Icons.logout)
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String headerText;
  final String subText;
  final Function onTap;

  SettingTile(this.headerText,this.subText,this.onTap,this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListTile(
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70.0), bottomRight: Radius.circular(70.0)
          ),),
        onTap: onTap as void Function()?,
        contentPadding: EdgeInsets.all(8.0),
        trailing: Icon(Icons.chevron_right),
        tileColor: Colors.red,
        dense: true,
        leading: CircleAvatar(child: Icon(icon),radius: 25.0,backgroundColor: Color(0xffDFE7F5).withOpacity(0.2),),
        title: Text(headerText,style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 16.0),),
        subtitle: Text(subText,style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 12.0),),
      ),
    );
  }
}


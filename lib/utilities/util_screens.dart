import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plando/utilities/app_colors.dart';
import 'package:plando/utilities/route_names.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color:Color.fromRGBO(255, 255, 255, 0.9),child: Center(child: Column
      (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SpinKitPouringHourglass(color: AppColors.textWhite,size: 50.0,duration: Duration(milliseconds: 1500),),
        Text('Loading...',style: TextStyle(fontWeight: FontWeight.normal,color: AppColors.textWhite,fontSize: 16.0),)
      ],
    )));
  }
}


class ShowException extends StatefulWidget {

  final Stream<String>? stream;
  const ShowException({Key? key,this.stream}):super(key: key);
  @override
  _ShowExceptionState createState() => _ShowExceptionState();
}

class _ShowExceptionState extends State<ShowException> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.active && snapshot.hasData)
          {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.red,
                ),
                child: Center(child: Text("${snapshot.data}",style: TextStyle(color: Colors.white),)),
              ),
            );
          }
          else
          {
            return Container();
          }
        });
  }
}

class SideNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 24.0,
      child: Container(
        color: Color(0xFFF0EDFD),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.0,),
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage('https://www.stockvault.net//data/2019/08/31/269064/thumb16.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: 12.0,),
                    Text("Rapid Fly",style: TextStyle(color: AppColors().color4, fontSize: 14.0, fontWeight: FontWeight.w600,)),
                    SizedBox(height: 12.0,),
                    Text("plando@quantana.in",style: TextStyle(color: AppColors().color4, fontSize: 14.0, fontWeight: FontWeight.w600,)),
                    SizedBox(height: 28.0,),
                    OutlinedButton(onPressed: (){}, child: Text("Logout",style: TextStyle(color: AppColors().color4, fontSize: 14.0, fontWeight: FontWeight.w500,),),style: OutlinedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width,40.0),
                        side: BorderSide(color: Colors.deepPurple,style: BorderStyle.solid),
                        shape: StadiumBorder()
                    ),),
                    SizedBox(height: 24.0,),
                  ],
                ),
              ),
            ),
            DrawerButton(icon: Icons.new_releases_sharp,name: "Neumorphism",onTap:(){
              Navigator.pushNamed(context, PathName.Neumorphism);
            }),
            DrawerButton(icon: Icons.list_alt,name: "Pro ListView",onTap:(){
              Navigator.pushNamed(context, PathName.proListView);

            }),
            DrawerButton(icon: Icons.list_rounded,name: "Separated List View",onTap:(){
              Navigator.pushNamed(context, PathName.separatedListView);
            }),
            DrawerButton(icon: Icons.image,name: "Image Upload and Crop",onTap:(){
              Navigator.pushNamed(context, PathName.ImageUpload);
            }),
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final Function? onTap;
  final String? name;
  final IconData? icon;
  DrawerButton({this.name,this.icon,this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap as void Function()?,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          width: MediaQuery.of(context).size.width,
          height: 46.0,
          child: Row(
            children: [
              Icon(icon,size: 24.0,color: AppColors().color4,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 18.0)),
              Text(name!,style: regularTextStyle,)
            ],
          ),
        ),
      ),
    );
  }

  final regularTextStyle = TextStyle(
    color: AppColors().color4,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
}





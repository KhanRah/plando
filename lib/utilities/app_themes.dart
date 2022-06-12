import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plando/utilities/app_colors.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey,
      fontFamily: 'QuickSand',
      appBarTheme: AppBarTheme(
        color: Colors.black,
        centerTitle: false,
        titleTextStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,color: Colors.white70),
        iconTheme: IconThemeData(
          color: Color(0xffffffff),
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.white,
        onPrimary: Colors.white,
        primaryVariant: Colors.white,
        secondary: Colors.red,
      ),
      cardTheme: CardTheme(
          color: Colors.black87,
          elevation: 0.9,
          shadowColor: Colors.white70,
          clipBehavior: Clip.none
      ),
      iconTheme: IconThemeData(
        color: Color(0xff8C8C8C),
      ),
      buttonTheme: ButtonThemeData(height: 48.0,textTheme: ButtonTextTheme.accent,buttonColor: Color(0xff3F7DEF),),
      bottomAppBarColor:Colors.black12,
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.textWhite,
        unselectedLabelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600),
        labelPadding: EdgeInsets.symmetric(vertical: 4.0),
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle: TextStyle(fontSize: 12.0,fontWeight: FontWeight.normal),
      ),

      textTheme: TextTheme(
        button: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,color: Color(0xffFFFFFF)),
        headline1: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,color: Color(0xff3F7DEF)),
        caption: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Colors.white),
        headline2: TextStyle(fontSize: 48.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xffDB5B46)),
        headline3: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xff8C8C8C)),
        headline4: TextStyle(fontSize: 48.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xff7FC464)),
        headline5: TextStyle(fontSize: 48.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xff85D3FF)),
        headline6: TextStyle(fontSize: 48.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xffF2CE5F)),
      ),


      dividerTheme: DividerThemeData(color: Color(0xffEBEFF2),thickness: 1.0),
      dividerColor: Colors.black26,
      platform: TargetPlatform.iOS
  );

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF0EDFD),
      fontFamily: 'Quicksand',
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: Color(0xffFFFFFF)),
          color:  AppColors().color4,
          textTheme: TextTheme(),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,color: Color(0xffFFFFFF)),
          iconTheme: IconThemeData(
            color: Color(0xffFFFFFF),
          ),
          brightness: Brightness.dark
      ),
      colorScheme: ColorScheme.light(
        primary: Color(0xff042C5C),
        onPrimary: Colors.white,
        primaryVariant: Colors.white38,
        secondary: Colors.red,
      ),
      cardTheme: CardTheme(
          color: Color(0xffFFFFFF),
          elevation: 0.9,
          shadowColor: Colors.black12,
          clipBehavior: Clip.none
      ),
      iconTheme: IconThemeData(
        color: Color(0xffDDDDDD),
      ),
      buttonTheme: ButtonThemeData(height: 48.0,textTheme: ButtonTextTheme.accent,buttonColor: Color(0xff042C5C),),
      bottomAppBarColor:Colors.white,
      tabBarTheme: TabBarTheme(
        labelColor: Color(0xff042C5C),
        unselectedLabelColor: Color(0xff77869E),
        labelStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600),
        labelPadding: EdgeInsets.symmetric(vertical: 4.0),
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle: TextStyle(fontSize: 12.0,fontWeight: FontWeight.normal),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        backgroundColor: AppColors().color4,
      ),
      textTheme: TextTheme(
        button: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,color: Color(0xffFFFFFF)),
        headline1: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xff042C5C)),
        caption: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xff292929)),
        headline2: TextStyle(fontSize: 48.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xffDB5B46)),
        headline3: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xff77869E)),
        headline4: TextStyle(fontSize: 28.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Color(0xff7FC464))),
      brightness: Brightness.light,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(12.0),topRight: Radius.circular(12.0)),
          )
      ),
      dividerTheme: DividerThemeData(color: Color(0xffEBEFF2),thickness: 1.0),
      dividerColor: Color(0xffEBEFF2),
      platform: TargetPlatform.iOS
  );
}

Gradient gradient1 = LinearGradient(
    colors: [AppColors().color5,AppColors().color6]
);

Gradient gradient2 = LinearGradient(
    colors: [AppColors().color4,AppColors().color3]
);

Gradient gradient3 = LinearGradient(
    colors: [AppColors().color8,AppColors().color7]
);
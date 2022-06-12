import 'package:flutter/material.dart';
import 'package:plando/screens/create_service_request.dart';
import 'package:plando/screens/new_service_request.dart';
import 'package:plando/screens/home_screen.dart';
import 'package:plando/screens/pin_verification_screen.dart';
import 'package:plando/screens/service_requests_view.dart';
import 'package:plando/screens/login%20screen.dart';
import 'package:plando/screens/otp_screen.dart';
import 'package:plando/screens/splash_view.dart';
import 'package:plando/screens/user_choosing_view.dart';
import 'package:plando/utilities/route_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    debugPrint('arguments passed from RouterModule $args');
    switch (settings.name)
    {
      case PathName.splashScreen:
        {
          return MaterialPageRoute(builder: (_) => SplashScreen());
        }
      case PathName.loginScreen:
        {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }
      case PathName.listViewScreen:
        {
          return MaterialPageRoute(builder: (_) => ServiceRequestsView());
        }
      case PathName.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      case PathName.otpView:
        {
          return MaterialPageRoute(builder: (_) => OTPScreen(mobileNumber: args as String,));
        }
      case PathName.userChoosingView:
        {
          return MaterialPageRoute(builder: (_) => const UserChooseCompanyView());
        }
      case PathName.newServiceRequest:
        {
          return MaterialPageRoute(builder: (_) => const NewServiceRequest());
        }
      case PathName.createServiceRequest:
        {
          return MaterialPageRoute(builder: (_) => const CreateServiceRequest());
        }
      case PathName.pinVerificationView:
        {
          return MaterialPageRoute(builder: (_) => PinVerificationScreen(mobileNumber: args as String));
        }
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}')),));
    }
  }
}

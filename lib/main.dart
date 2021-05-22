import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mopco/app_screens/splash.dart';
import 'package:mopco/app_screens/start_screen.dart';
import 'app_screens/login.dart';
import 'admin_vacation/admin_home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var code = preferences.getString('code');
  runApp(
    MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      //home : AdminHome(),
    home: (code == null) ? LoginScreen1() : StartScreen(),
    ),
  );
}

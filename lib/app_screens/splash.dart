import 'package:flutter/material.dart';
import 'package:mopco/app_screens/login.dart';
import 'package:mopco/app_screens/start_screen.dart';
import 'package:shimmer/shimmer.dart';

class SplashActivity extends StatefulWidget {
  @override
  _SplashActivityState createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {

  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status){
            _navigateToHome();
          }else _navigateTologin();
        }
    );
  }

  Future<bool> _mockCheckForSession() async {

    await Future.delayed(Duration(milliseconds: 5000), () {} );

    return false;

  }

  void  _navigateTologin(){

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen1()
      )
    );

  }

  void  _navigateToHome(){

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => StartScreen(),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children:<Widget>[
            Opacity(
                opacity: 0.5,
                child: Container(),
            ),
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.green[300],
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Mopco',
                  style: TextStyle(
                      fontSize: 90.0,
                      fontFamily: 'Pacifico',
                      shadows: <Shadow>[
                        Shadow(
                          blurRadius: 18.0,
                          color: Colors.black87,
                          offset: Offset.fromDirection(120,12),
                        )
                      ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mopco/app_screens/start_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/flutterProjects/projects/mopco/mopco/lib/app_screens/change_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mopco/models/code_list.dart';
import 'package:connectivity/connectivity.dart';

CodeModel codeModel = CodeModel();

class LoginScreen1 extends StatefulWidget {
  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  //---------------------------------------------------------------------
  final _formKey = GlobalKey<FormState>();
  final _fireStore = Firestore.instance;
  String code, password, savedPassword;
  bool logged, obscurePass = true, spinner = false;

  //----------------------------------------------------------------------------
  getLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    logged = preferences.getBool('logged');
  }

  //-----------------------------------------------------------------------
  void getPassword(code) async {
    await for (var snapshot in _fireStore.collection("password").snapshots()) {
      for (var message in snapshot.documents) {
        if (code == message.data['code']) {
          savedPassword = message.data['password'];
        }
      }
    }
  }

  //-----------------------------------------------------------------------
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  ]);

  final codeValidator = MultiValidator([
    RequiredValidator(errorText: 'code is required'),
    LengthRangeValidator(min: 4, max: 4, errorText: 'code must be 4 digits'),
  ]);

  //----------------------------------------------------------------------------
  @override
  void initState() {
    setState(() {
      getLoginStatus();
    });
    super.initState();
  }

  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        backgroundColor: Color(0xFF1E4F6F),
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Builder(
            builder: (context) => ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Image.asset('images/logo_final.PNG'),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          onChanged: (val) {
                            code = val;
                            getPassword(code);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'code',
                            hintText: 'enter your code',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                          ),
                          validator: codeValidator,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      //-------------------------------------------------------
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          onChanged: (val) {
                            password = val;
                          },
                          style: TextStyle(color: Colors.white),
                          obscureText: obscurePass,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: obscurePass
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                              onPressed: () {
                                setState(() {
                                  obscurePass = !obscurePass;
                                });
                              },
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'password',
                            hintText: 'enter  password',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.vpn_lock,
                              color: Colors.white,
                            ),
                          ),
                          validator: passwordValidator,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        onPressed: () async {
                          var connectivityResult =
                              await (Connectivity().checkConnectivity());

                          if (_formKey.currentState.validate()) {
                            if ((connectivityResult !=
                                    ConnectivityResult.mobile) &&
                                (connectivityResult !=
                                    ConnectivityResult.wifi)) {
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                backgroundColor: Colors.black,
                                duration: Duration(seconds: 3),
                                content: Text(
                                  "No internet Connection !",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ));
                            } else {
                              if (!codeModel.codeList.contains(code)) {
                                Scaffold.of(context).showSnackBar(new SnackBar(
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                  content: Text(
                                    "Code doesn\'t exist",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ));
                              } else {
                                if (password == 'mopco123456' &&
                                    logged == null) {
                                  //--------------------------------------------------------------------------
                                  SharedPreferences preferences1 =
                                      await SharedPreferences.getInstance();
                                  preferences1.setString('code', code);

                                  SharedPreferences preferences2 =
                                      await SharedPreferences.getInstance();
                                  preferences2.setBool('logged', true);
                                  //--------------------------------------------------------------------------
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => ChangePassword(
                                        code: code,
                                      ),
                                    ),
                                  );
                                } else if (password == savedPassword) {
                                  SharedPreferences preferences1 =
                                      await SharedPreferences.getInstance();
                                  preferences1.setString('code', code);
                                  //--------------------------------------------------------------------------
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => StartScreen(),
                                    ),
                                  );
                                } else {
                                  Scaffold.of(context)
                                      .showSnackBar(new SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                    content: Text(
                                      "Password is incorrect",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ));
                                }
                              }
                            }
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E4F6F),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

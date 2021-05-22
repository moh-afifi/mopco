import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/app_screens/start_screen.dart';
import 'package:connectivity/connectivity.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({this.code});
  final String code;
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  //---------------------------------------------------------------
  final _fireStore = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  ]);

  //---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      body: ListView(
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
            child: Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'new password',
                  hintText: 'enter your new password',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                ),
                validator: passwordValidator,
                keyboardType: TextInputType.phone,
              ),
            ),
          ),
          SizedBox(height: 40,),
          //-------------------------------------------------------
          Container(
            margin: EdgeInsets.symmetric(horizontal: 150),
            child: FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              onPressed: () async {
                var connectivityResult = await (Connectivity().checkConnectivity());
                  if (_formKey.currentState.validate()) {
                    if ((connectivityResult != ConnectivityResult.mobile)&&(connectivityResult != ConnectivityResult.wifi)){
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 3),
                        content:
                        Text("No internet Connection !",style: TextStyle(fontSize: 17),),
                      ));
                    }else{
                      //-------------------------------------------------------
                      DocumentReference reference =
                      _fireStore.document("password/" + '${widget.code}');
                      Map<String, String> myData = {'password': _passwordController.text,'code':widget.code};
                      reference.setData(myData);
                      //--------------------------------------------------------
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => StartScreen(),
                        ),
                      );
                      //--------------------------------------------------------
                    }
                  }
              },
              child: Text(
                'Ok',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF1E4F6F),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

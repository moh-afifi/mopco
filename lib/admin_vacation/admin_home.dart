import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mopco/admin_vacation/add_annual_vacation.dart';
import 'package:mopco/models/code_list.dart';
import 'package:mopco/admin_vacation/choose_vacation_type.dart';
CodeModel codeModel =CodeModel();

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  //-------------------------------------------------------------------
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final codeValidator = MultiValidator([
    RequiredValidator(errorText: 'code is required'),
    LengthRangeValidator(min: 4, max: 4, errorText: 'code must be 4 digits'),
  ]);

  //-------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      body: Builder(
        builder: (context)=> Padding(
          padding: EdgeInsets.all(12.0),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Image.asset('images/logo_final.PNG',height: 100,),
          ),
          // SizedBox(
          //   height: 60,
          // ),
          Text(
            'أدخل كود الموظف:',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _codeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                labelText: 'الكود',
                //hintText: 'enter your code',
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
          SizedBox(
            height: 15,
          ),
          //--------------------------------------------------------
          Center(
            child: FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(8.0),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  if(!codeModel.codeList.contains(_codeController.text)){
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
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseVacationType(
                          code: _codeController.text,
                        ),
                      ),
                    );
                  }

                }
              },
              child: Text(
                'بحث',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E4F6F),
                ),
              ),
            ),
          ),
          //----------------------------------------------------------------
        ],
      ),
    ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mopco/admin_vacation/add_annual_vacation.dart';
import 'package:mopco/admin_vacation/add_sudden_vacation.dart';
import 'add_rest_vacation.dart';
import 'add_hours_vacation.dart';
import 'add_disease_vacation.dart';

class ChooseVacationType extends StatefulWidget {
  ChooseVacationType({this.code});

  final String code;

  @override
  _ChooseVacationTypeState createState() => _ChooseVacationTypeState();
}

class _ChooseVacationTypeState extends State<ChooseVacationType> {
  String typeOfVacation =  'إجازة سنوية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E4F6F),
        title: Text(
          'الصفحة الرئيسية',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Image.asset('images/logo_final.PNG',height: 100,),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'اختر نوع الاجازة:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text('chooose'),
              value: typeOfVacation,
              dropdownColor: Color(0xFF1E4F6F),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  typeOfVacation = newValue;
                if (typeOfVacation == 'إجازة سنوية') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAnnualVacation(
                        code: widget.code,
                      ),
                    ),
                  );
                  } else if (typeOfVacation == 'عارضة') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSuddenVacation(
                        code: widget.code,
                      ),
                    ),
                  );
                  } else if (typeOfVacation == 'راحة') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddRestVacation(
                        code: widget.code,
                      ),
                    ),
                  );
                  } else if (typeOfVacation == 'ساعات') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddHoursVacation(
                        code: widget.code,
                      ),
                    ),
                  );
                  } else if (typeOfVacation == 'مرضي') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddDiseaseVacation(
                        code: widget.code,
                      ),
                    ),
                  );
                  }
                });
              },
              items: <String>[
                'إجازة سنوية',
                'عارضة',
                'راحة',
                'ساعات',
                'مرضي'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mopco/emp_vacations/annual_vacations.dart';
import 'package:mopco/emp_vacations/sudden_vacations.dart';
import 'package:mopco/emp_vacations/rest_vacations.dart';
import 'package:mopco/emp_vacations/hours_vacations.dart';
import 'package:mopco/emp_vacations/disease_vacations.dart';

class ChooseVacationType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        title: Text(
          'اختر نوع الاجازة',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1E4F6F),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(10),
            tileColor: Colors.white,
            title: Text(
              'رصيد الاجازات السنوية',
              style: TextStyle(color: Color(0xFF1E4F6F), fontSize: 20),
            ),
            trailing: Icon(
              Icons.calendar_today,
              size: 40,
              color: Colors.pink,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AnnualVacations(appBarTitle: 'رصيد الاجازات السنوية',),
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            tileColor: Colors.white,
            title: Text(
              'رصيد الاجازات العارضة',
              style: TextStyle(color: Color(0xFF1E4F6F), fontSize: 20),
            ),
            trailing: Icon(
              Icons.subtitles_rounded,
              size: 40,
              color: Colors.pink,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SuddenVacations(appBarTitle:  'رصيد الاجازات العارضة',),
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            tileColor: Colors.white,
            title: Text(
              'رصيد الراحات',
              style: TextStyle(color: Color(0xFF1E4F6F), fontSize: 20),
            ),
            trailing: Icon(
              Icons.reset_tv,
              size: 40,
              color: Colors.pink,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RestVacations(appBarTitle: 'رصيد الراحات',),
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            tileColor: Colors.white,
            title: Text(
              'رصيد الساعات',
              style: TextStyle(color: Color(0xFF1E4F6F), fontSize: 20),
            ),
            trailing: Icon(
              Icons.hourglass_bottom,
              size: 40,
              color: Colors.pink,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HoursVacations(appBarTitle: 'رصيد الساعات',),
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            tileColor: Colors.white,
            title: Text(
              'الاجازات المرضي',
              style: TextStyle(color: Color(0xFF1E4F6F), fontSize: 20),
            ),
            trailing: Icon(
              Icons.medical_services_outlined,
              size: 40,
              color: Colors.pink,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DiseaseVacations(appBarTitle: 'الاجازات المرضي',),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

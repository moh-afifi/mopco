import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/widgets/vacation_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnnualVacations extends StatefulWidget {
  AnnualVacations({this.appBarTitle});
  final String appBarTitle;
  @override
  _AnnualVacationsState createState() => _AnnualVacationsState();
}

class _AnnualVacationsState extends State<AnnualVacations> {
  final _firestore = Firestore.instance;
  String name,
      section,
      workDestination,
      joinDate,
      deserveDate,
      endDate,
      deserveVacation,
      usedVacation,
      restVacation;
  String code;

  void getCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    code = preferences.getString('code');
  }

  @override
  void initState() {
    getCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1E4F6F),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('سنوي').snapshots(),
          builder: (context, snapshot) {
            //--------------------------------------
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ),
              );
            }
            //--------------------------------------
            final items = snapshot.data.documents;

            List<VacationCard> cardList = [];

            for (var item in items) {
              if (code == (item.data['الرقم']).toString()) {
                name = item.data['الاسم'];
                section = (item.data['الادارة']).toString();
                deserveVacation = (item.data['المستحق']).toString();
                usedVacation = (item.data['المستنفد']).toString();
                restVacation = (item.data['باقي السنوي']).toString();
                deserveDate =
                    (item.data['تاريخ استحقاق الاجازات السنوية']).toString();
                joinDate = (item.data['تاريخ الالتحاق بالشركة']).toString();
                endDate = (item.data['تاريخ انتهاء السنه الخاصة']).toString();
                workDestination = (item.data['جهه العمل']).toString();

                var cardItem = VacationCard(
                  name: name,
                  deserveDate: deserveDate,
                  deserveVacation: deserveVacation,
                  endDate: endDate,
                  joinDate: joinDate,
                  restVacation: restVacation,
                  section: section,
                  usedVacation: (usedVacation == '') ? '0' : usedVacation,
                  workDestination: workDestination,
                );

                cardList.add(cardItem);
              }
            }

            return (name == null)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.yellow,
                          child: Icon(
                            Icons.warning,
                            color: Colors.white,
                            size: 100,
                          ),
                        ),
                        Text(
                          'لا توجد إجازات مسجلة حتى الآن',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: cardList,
                        ),
                      ),
                    ],
                  );
          }),
    );
  }
}

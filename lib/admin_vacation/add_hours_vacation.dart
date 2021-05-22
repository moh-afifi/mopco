import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/widgets/vacation_card.dart';
import 'package:mopco/dialogs/make_hour_dialog.dart';
import 'hours_vacation_details.dart';

class AddHoursVacation extends StatefulWidget {
  AddHoursVacation({this.code});
  final String code;
  @override
  _AddHoursVacationState createState() => _AddHoursVacationState();
}

class _AddHoursVacationState extends State<AddHoursVacation> {

  final _firestore = Firestore.instance;
  String name,
      section,
      workDestination,
      deserveVacation,
      usedVacation,
      restVacation,
      docId;
  //--------------------------------------------------------------------------------
  void makeHoursDialog(String code, String docId, String numOfDeserved) {
    showDialog(
      context: context,
      builder: (BuildContext context) => MakeHourDialog(
        code: code,
        docId: docId,
        numOfDeserved: numOfDeserved,
      ),
    );
  }
  //--------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E4F6F),
        title: Text(
          'تسجيل ساعات',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
                icon: Icon(
                  Icons.date_range,
                  size: 45,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HoursVacationDetails(
                          code: widget.code,
                        )),
                  );
                }),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('ساعات').snapshots(),
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

            List<Widget> cardList = [];

            for (var item in items) {
              if (widget.code == (item.data['الرقم']).toString()) {
                name = item.data['الاسم'];
                section = (item.data['الادارة']).toString();
                deserveVacation = (item.data['اجمالى الساعات']).toString();
                usedVacation = (item.data['المستنفذ من الساعات']).toString();
                restVacation = (item.data['المتبقي']).toString();
                workDestination = (item.data['جهه العمل']).toString();
                docId = item.documentID;

                var cardItem = VacationCard(
                  name: name,
                  deserveDate: null,
                  deserveVacation: deserveVacation,
                  endDate: null,
                  joinDate: null,
                  restVacation: restVacation,
                  section: section,
                  usedVacation: usedVacation,
                  workDestination: workDestination,
                  docId: docId,
                  collectionName: 'ساعات',
                  field1: 'اجمالى الساعات',
                  field2: 'المستنفذ من الساعات',
                  field3: 'المتبقي',
                  showUpdateButton: true,
                );
                cardList.add(cardItem);
              }
            }
            return ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: FlatButton(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      onPressed: () {
                        makeHoursDialog(widget.code, docId, deserveVacation);
                      },
                      child: Text(
                        'تسجيل ساعات',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.teal,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: cardList,
                  )
                ]
            );
          }),
    );
  }
}

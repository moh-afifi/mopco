import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/widgets/vacation_card.dart';
import 'package:mopco/dialogs/make_rest_dialog.dart';
import 'rest_vacation_details.dart';
class AddRestVacation extends StatefulWidget {
  AddRestVacation({this.code});
  final String code;
  @override
  _AddRestVacationState createState() => _AddRestVacationState();
}

class _AddRestVacationState extends State<AddRestVacation> {

  final _firestore = Firestore.instance;
  String name,
      section,
      workDestination,
      joinDate,
      deserveVacation,
      usedVacation,
      restVacation,
      docId;
  //--------------------------------------------------------------------------------
  void makeRestDialog(String code, String docId, String numOfDeserved) {
    showDialog(
      context: context,
      builder: (BuildContext context) => MakeRestDialog(
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
          'تسجيل راحات',
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
                        builder: (context) => RestVacationDetails(
                          code: widget.code,
                        )),
                  );
                }),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('راحات').snapshots(),
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
                deserveVacation = (item.data['اجمالى الراحات']).toString();
                usedVacation = (item.data['المستنفذ من الراحات']).toString();
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
                  collectionName: 'راحات',
                  field1: 'اجمالى الراحات',
                  field2: 'المستنفذ من الراحات',
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
                        makeRestDialog(widget.code, docId, deserveVacation);
                      },
                      child: Text(
                        'تسجيل راحات',
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

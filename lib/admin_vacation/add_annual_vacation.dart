import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/admin_vacation/annual_vacation_details.dart';
import 'package:mopco/dialogs/make_regular_dialog.dart';
import 'package:mopco/widgets/vacation_card.dart';

class AddAnnualVacation extends StatefulWidget {
  AddAnnualVacation({this.code});

  final String code;

  @override
  _AddAnnualVacationState createState() => _AddAnnualVacationState();
}

class _AddAnnualVacationState extends State<AddAnnualVacation> {
  final _firestore = Firestore.instance;
  String name,
      section,
      workDestination,
      joinDate,
      deserveDate,
      endDate,
      deserveVacation,
      usedVacation,
      restVacation,
      docId;
  //-----------------------------------------------------------------
  void makeRegularDialog(String code, String docId, String numOfDeserved) {
    showDialog(
      context: context,
      builder: (BuildContext context) => MakeRegularDialog(
        code: code,
        docId: docId,
        numOfDeserved: numOfDeserved,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E4F6F),
        title: Text(
          'تسجيل إجازة سنوية',
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
                      builder: (context) => AnnualVacationDetails(
                        code: widget.code,
                      ),
                    ),
                  );
                }),
          ),
        ],
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

            List<Widget> cardList = [];

            for (var item in items) {
              if (widget.code == (item.data['الرقم']).toString()) {
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
                docId = item.documentID;

                var cardItem = VacationCard(
                  name: name,
                  deserveDate: deserveDate,
                  deserveVacation: deserveVacation,
                  endDate: endDate,
                  joinDate: joinDate,
                  restVacation: restVacation,
                  section: section,
                  usedVacation: usedVacation,
                  workDestination: workDestination,
                  docId: docId,
                  collectionName: 'سنوي',
                  field1: 'المستحق',
                  field2: 'المستنفد',
                  field3: 'باقي السنوي',
                  showUpdateButton: true,
                );
                cardList.add(cardItem);
              }
            }
            return ListView(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  onPressed: () {
                    makeRegularDialog(widget.code, docId, deserveVacation);
                  },
                  child: Text(
                    'تسجيل إجازة',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: cardList,
              )
            ]);
          }),
    );
  }
}

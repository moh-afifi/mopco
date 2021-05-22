import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/admin_vacation/disease_vacation_details.dart';
import 'package:mopco/dialogs/make_disease_dialog.dart';
import 'package:mopco/widgets/vacation_card.dart';

class AddDiseaseVacation extends StatefulWidget {
  AddDiseaseVacation({this.code});
  final String code;
  @override
  _AddDiseaseVacationState createState() => _AddDiseaseVacationState();
}

class _AddDiseaseVacationState extends State<AddDiseaseVacation> {
  final _firestore = Firestore.instance;
  String name,
      section,
      workDestination,
      joinDate,
      docId;
  //-----------------------------------------------------------------
  void makeDiseaseDialog(String code, String docId) {
    showDialog(
      context: context,
      builder: (BuildContext context) => MakeDiseaseDialog(
        code: code,
        docId: docId,
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
          'تسجيل إجازة مرضية',
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
                      builder: (context) => DiseaseVacationDetails(
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
                joinDate = (item.data['تاريخ الالتحاق بالشركة']).toString();
                workDestination = (item.data['جهه العمل']).toString();
                docId = item.documentID;

                var cardItem = VacationCard(
                  name: name,
                  deserveDate: null,
                  deserveVacation: null,
                  endDate: null,
                  joinDate: joinDate,
                  restVacation: null,
                  section: section,
                  usedVacation: null,
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
                    makeDiseaseDialog(widget.code, docId);
                  },
                  child: Text(
                    'تسجيل إجازة مرضية',
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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/widgets/vacaction_report_card.dart';

class HoursVacationDetails extends StatefulWidget {
  HoursVacationDetails({this.code});
  final String code;
  @override
  _HoursVacationDetailsState createState() => _HoursVacationDetailsState();
}

class _HoursVacationDetailsState extends State<HoursVacationDetails> {
  final _firestore = Firestore.instance;
  String numOfDays, from, to,docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E4F6F),
        title: Text(
          'تقرير الاجازات',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('تفاصيل الساعات')
              .orderBy('sort')
              .snapshots(),
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

            List<VacationReportCard> cardList = [];

            for (var item in items) {
              if (widget.code == item.data['code']) {
                numOfDays = (item.data['numOfDays']).toString();
                from = (item.data['from']).toString();
                to = (item.data['to']).toString();
                docId=item.documentID;
                var cardItem = VacationReportCard(
                  numOfDays: numOfDays,
                  from: from,
                  to: to,
                  docID: docId,
                  collectionName:'تفاصيل الساعات',
                );
                cardList.add(cardItem);
              }
            }

            return (numOfDays == null)
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
                : ListView(
              children: cardList,
            );
          }),
    );
  }
}

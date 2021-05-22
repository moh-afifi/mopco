import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mopco/widgets/disease_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiseaseVacations extends StatefulWidget {
  DiseaseVacations({this.appBarTitle});
final String appBarTitle;
  @override
  _DiseaseVacationsState createState() => _DiseaseVacationsState();
}

class _DiseaseVacationsState extends State<DiseaseVacations> {
  final _firestore = Firestore.instance;
  String from,to,fromCut,toCut,numOfDays;

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
          stream: _firestore.collection('مرضي').snapshots(),
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

            List<DiseaseCard> cardList = [];

            for (var item in items) {
              if (code == (item.data['code']).toString()) {
                from = item.data['from'];
                to = item.data['to'];
                fromCut = item.data['fromCut'];
                toCut = item.data['toCut'];
                numOfDays = (item.data['numOfDays']).toString();


                var cardItem = DiseaseCard(
                  toCut: toCut,
                  fromCut: fromCut,
                  to: to,
                  from: from,
                  numOfDays:numOfDays,
                );

                cardList.add(cardItem);
              }
            }

            return (toCut == null)
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

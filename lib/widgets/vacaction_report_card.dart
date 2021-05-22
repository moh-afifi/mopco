import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class VacationReportCard extends StatelessWidget {
  VacationReportCard(
      {this.from, this.to, this.numOfDays, this.docID, this.collectionName});

  final String from, to, numOfDays, docID, collectionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عدد الأيام: $numOfDays',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 200,
                  ),
                  (from == to)
                      ? Text(
                          '$from',
                          style: TextStyle(fontSize: 17, color: Colors.purple),
                        )
                      : Column(
                          children: [
                            Text(
                              'من : $from',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.purple),
                            ),
                            Text(
                              'إلى: $to',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.purple),
                            ),
                          ],
                        )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 50,
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              'هل أنت متأكد؟',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.red,
                                    child: Text(
                                      'إلغاء',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  FlatButton(
                                      color: Colors.teal,
                                      child: Text(
                                        'موافق',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        await _firestore
                                            .collection(collectionName)
                                            .document(docID)
                                            .delete();
                                      }),
                                ],
                              )
                              //-----------------------------------------
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

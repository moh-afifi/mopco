import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:mopco/dialogs/confirm_rest_dialog.dart';
import 'package:mopco/dialogs/days_must_dialog.dart';

class MakeRestDialog extends StatefulWidget {
  MakeRestDialog({this.code, this.docId,this.numOfDeserved});
  final String code, docId,numOfDeserved;
  @override
  _MakeRestDialogState createState() => _MakeRestDialogState();
}

class _MakeRestDialogState extends State<MakeRestDialog> {
  double numOfDays = 0;
  double numOfUsed = 0;
  String fromDate, toDate;
  final _fireStore = Firestore.instance;
  //--------------------------------------------------------------
  void mustDaysDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => DaysDialog(),
    );
  }
  //---------------------------------------------------
  void getUsedVacation() async {
    await for (var snapshot in _fireStore.collection("راحات").snapshots()) {
      for (var message in snapshot.documents) {
        if (widget.code == (message.data['الرقم']).toString()) {
          numOfUsed = (message.data['المستنفذ من الراحات']).toDouble();
        }
      }
    }
  }
  //--------------------------------------------------------------
  void confirmRestDialog(
      String from, String to, double numOfDays, String code, double used,String deserved,String docId) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmRestDialog(
        from: from,
        to: to,
        numOfDays: numOfDays,
        code: code,
        numOfUsed: used,
        numOfDeserved: deserved,
        docId: docId,
      ),
    );
  }
  //-----------------------------------------------------------------------
  @override
  void initState() {
    setState(() {
      getUsedVacation();
    });
    super.initState();
  }
  //------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'تسجيل راحة',
          style: TextStyle(
              fontSize: 25,
              color: Color(0xFF1E4F6F),
              fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              textAlign: TextAlign.start,
              onChanged: (value) {
                numOfDays = double.parse(value);
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ادخل عدد الايام",
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'اختر التاريخ',
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF1E4F6F),
                    fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(
                    Icons.today,
                    color: Colors.white,
                    size: 33,
                  ),
                  onPressed: () async {
                    final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate: (new DateTime.now())
                            .subtract(new Duration(days: 6)),
                        initialLastDate: new DateTime.now(),
                        firstDate: new DateTime(2021),
                        lastDate: new DateTime(2022));
                    if (picked != null) {
                      String text = picked.toString();
                      print(text);
                      fromDate = text.substring(1, 11);
                      //------------------------------------------------
                      String start = ',';
                      String end = ']';
                      final startIndex = text.indexOf(start);
                      final endIndex =
                      text.indexOf(end, startIndex + start.length);
                      toDate = text
                          .substring(startIndex + start.length, endIndex)
                          .substring(1, 11);
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }
                    //-------------------------------------------------
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: FlatButton(
              padding: EdgeInsets.all(10),
              color: Color(0xFF1E4F6F),
              onPressed: () {
                if (fromDate == null || toDate == null) {
                  //do nothing
                } else if (numOfDays == 0) {
                  Navigator.pop(context);
                  mustDaysDialog();
                } else {
                  Navigator.pop(context);
                  confirmRestDialog(fromDate, toDate, numOfDays,
                      widget.code, numOfUsed,widget.numOfDeserved,widget.docId);
                }
              },
              child: Text(
                'موافق',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
          //-----------------------------------------
        ],
      ),
      elevation: 8.0,
    );
  }
}

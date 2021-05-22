import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:mopco/dialogs/confirm_disease_dialog.dart';
import 'package:mopco/dialogs/days_must_dialog.dart';

class MakeDiseaseDialog extends StatefulWidget {
  MakeDiseaseDialog({this.code, this.docId,this.numOfDeserved});
  final String code, docId,numOfDeserved;
  @override
  _MakeDiseaseDialogState createState() => _MakeDiseaseDialogState();
}

class _MakeDiseaseDialogState extends State<MakeDiseaseDialog> {
  double numOfDays = 0;
  double numOfUsed = 0;
  String fromDate, toDate,fromDateCut,toDateCut;
  //--------------------------------------------------------------
  void mustDaysDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => DaysDialog(),
    );
  }
  //---------------------------------------------------
  void confirmDiseaseDialog(
      String from, String to,String fromCut,String toCut, double numOfDays, String code,String docId) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmDiseaseDialog(
        from: from,
        to: to,
        numOfDays: numOfDays,
        code: code,
        docId: docId,
        fromCut: fromDateCut,
        toCut:toDateCut ,
      ),
    );
  }
  //------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'تسجيل إجازة مرضية',
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
                    ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'اختر تاريخ الخصم',
                style: TextStyle(
                    fontSize: 17,
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
                      fromDateCut = text.substring(1, 11);
                      //------------------------------------------------
                      String start = ',';
                      String end = ']';
                      final startIndex = text.indexOf(start);
                      final endIndex =
                      text.indexOf(end, startIndex + start.length);
                      toDateCut = text
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
                if (fromDate == null || toDate == null||fromDateCut==null||toDateCut==null) {
                  //do nothing
                } else if (numOfDays == 0) {
                  Navigator.pop(context);
                  mustDaysDialog();
                } else {
                  Navigator.pop(context);
                  confirmDiseaseDialog(fromDate, toDate,fromDateCut,toDateCut,numOfDays,
                      widget.code,widget.docId);
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

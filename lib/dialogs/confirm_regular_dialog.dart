import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:mopco/dialogs/connect_dialog.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class ConfirmRegularDialog extends StatefulWidget {
  ConfirmRegularDialog(
      {this.from,
      this.to,
      this.numOfDays,
      this.code,
      this.numOfUsed,
      this.numOfDeserved,this.docId});
  final String from, to, code,docId,numOfDeserved;
  final double numOfDays, numOfUsed;

  @override
  _ConfirmRegularDialogState createState() => _ConfirmRegularDialogState();
}

class _ConfirmRegularDialogState extends State<ConfirmRegularDialog> {
  final _fireStore = Firestore.instance;
  bool spinner=false;
  // int month;
  // String dash;
  //--------------------------------------------------------------
  void connectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConnectDialog(),
    );
  }

  //--------------------------------------------------------------
  // @override
  // void initState() {
  //   dash = (widget.date).substring(5, 6);
  //   if (dash == '-') {
  //     month = int.parse((widget.date).substring(3, 5));
  //   } else {
  //     month = int.parse((widget.date).substring(3, 4));
  //   }
  //   super.initState();
  // }

  //----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: AlertDialog(
        title: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.yellow,
          child: Icon(
            Icons.warning,
            color: Colors.white,
            size: 50,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (widget.to == widget.from)
                ? Text(
                    '${widget.from}',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  )
                : Column(
                    children: [
                      Text(
                        'من : ${widget.from}',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'إلى : ${widget.to}',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
            Text(
              'عدد الأيام : ${widget.numOfDays}',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 8.0,
        actions: <Widget>[
          SizedBox(
            width: 30,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.red,
            child: Text(
              'إلغاء',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          FlatButton(
            color: Colors.teal,
            child: Text(
              'تأكيد',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              var connectivityResult = await (Connectivity().checkConnectivity());
              if ((connectivityResult == ConnectivityResult.mobile) ||
                  (connectivityResult == ConnectivityResult.wifi)) {
                //------------------------------------------------------------
                setState(() {
                  spinner=true;
                });
                //------------------------------------------------------------
                //here I got the (old vacation) + (new vacation)
                double addedVacation = widget.numOfDays + widget.numOfUsed;
                //here I update the old existed vacation
                DocumentReference reference1 = _fireStore.document("سنوي/${widget.docId}");
                Map<String, dynamic> myData1 = {
                  'المستنفد': addedVacation,
                };
                await reference1.updateData(myData1);
                //------------------------------------------------------------
                //here I got the rest num of days
                double restVacation = double.parse(widget.numOfDeserved)-addedVacation;
                // here I update the rest num of days
                DocumentReference reference2 = _fireStore.document("سنوي/${widget.docId}");
                Map<String, dynamic> myData2 = {
                  'باقي السنوي': restVacation,
                };
                await reference2.updateData(myData2);
                //-----------------------------------------------------------
                 await  _fireStore.collection('تفاصيل السنوي').add({
                  'code': widget.code,
                  'numOfDays': widget.numOfDays,
                  'from': widget.from,
                  'to': widget.to,
                  'sort':DateTime.now().millisecondsSinceEpoch,
                });
                //-----------------------------------------------------------
                setState(() {
                  spinner=false;
                });
                //------------------------------------------------------------
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
                connectDialog();
              }
            },
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}

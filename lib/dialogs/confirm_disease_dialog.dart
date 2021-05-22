import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:mopco/dialogs/connect_dialog.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class ConfirmDiseaseDialog extends StatefulWidget {
  ConfirmDiseaseDialog(
      {this.from,
        this.to,
        this.numOfDays,
        this.code,
        this.numOfUsed,
        this.numOfDeserved,this.docId,this.fromCut,this.toCut});
  final String from, to, code,docId,numOfDeserved,fromCut,toCut;
  final double numOfDays, numOfUsed;

  @override
  _ConfirmDiseaseDialogState createState() => _ConfirmDiseaseDialogState();
}

class _ConfirmDiseaseDialogState extends State<ConfirmDiseaseDialog> {
  final _fireStore = Firestore.instance;
  bool spinner=false;
  //--------------------------------------------------------------
  void connectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConnectDialog(),
    );
  }
  //--------------------------------------------------------------
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
                Divider(
                  color: Colors.black,

                ),
                Text(
                  'تاريخ الخصم من : ${widget.fromCut}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'تاريخ الخصم إلى : ${widget.toCut}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              color: Colors.black,

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
                await  _fireStore.collection('مرضي').add({
                  'code': widget.code,
                  'numOfDays': widget.numOfDays,
                  'from': widget.from,
                  'to': widget.to,
                  'fromCut': widget.fromCut,
                  'toCut': widget.toCut,
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

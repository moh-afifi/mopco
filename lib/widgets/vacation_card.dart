import 'package:flutter/material.dart';
import 'package:mopco/widgets/label_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class VacationCard extends StatefulWidget {
  VacationCard(
      {this.name,
      this.section,
      this.deserveDate,
      this.deserveVacation,
      this.endDate,
      this.joinDate,
      this.restVacation,
      this.usedVacation,
      this.workDestination,
      this.docId,
      this.collectionName,
      this.field1,
      this.field2,
      this.field3,
      this.showUpdateButton});

  final String name,
      section,
      workDestination,
      joinDate,
      deserveDate,
      endDate,
      deserveVacation,
      usedVacation,
      restVacation,
      docId;
  final String collectionName, field1, field2, field3;
  final bool showUpdateButton;

  @override
  _VacationCardState createState() => _VacationCardState();
}

class _VacationCardState extends State<VacationCard> {
  String updatedValue;

  showUpdateDialog({Function update}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'تعديل',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                textAlign: TextAlign.start,
                onChanged: (value) {
                  setState(() {
                    updatedValue = value;
                  });
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "قم بادخال عدد الايام",
                  labelText: "عدد الايام",
                ),
              ),
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  FlatButton(
                      color: Colors.teal,
                      child: Text(
                        'موافق',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        update();
                      }),
                ],
              )
              //-----------------------------------------
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelCard(
          label: 'الاسم : ${widget.name}',
        ),
        LabelCard(
          label: 'الإدارة : ${widget.section}',
        ),
        LabelCard(
          label: 'جهة العمل : ${widget.workDestination}',
        ),
        (widget.joinDate == null)
            ? SizedBox()
            : LabelCard(
                label: 'تاريخ الالتحاق بالشركة : ${widget.joinDate}',
              ),
        (widget.deserveDate == null)
            ? SizedBox()
            : LabelCard(
                label: 'تاريخ استحقاق الاجازات: ${widget.deserveDate}',
              ),
        (widget.endDate == null)
            ? SizedBox()
            : LabelCard(
                label: 'تاريخ انتهاء السنة الخاصة: ${widget.endDate}',
              ),
        (widget.deserveVacation == null)
            ? SizedBox()
            : LabelCard(
                width: 0.333,
                label: 'المستحق: ${widget.deserveVacation}',
                color: Colors.teal,
                update: () async {
                  showUpdateDialog(update: () async {
                    Navigator.of(context);
                    await _firestore
                        .collection(widget.collectionName)
                        .document(widget.docId)
                        .updateData({
                      widget.field1: updatedValue,
                    });
                  });
                },
                showUpdateButton: widget.showUpdateButton,
              ),
        (widget.usedVacation == null)
            ? SizedBox()
            : LabelCard(
                width: 0.333,
                label: 'المستنفد : ${widget.usedVacation}',
                color: Colors.red,
                update: () async {
                  showUpdateDialog(update: () async {
                    Navigator.of(context);
                    await _firestore
                        .collection(widget.collectionName)
                        .document(widget.docId)
                        .updateData({
                      widget.field2: updatedValue,
                    });
                  });
                },
                showUpdateButton: widget.showUpdateButton,
              ),
        (widget.restVacation == null)
            ? SizedBox()
            : LabelCard(
                width: 0.333,
                label: 'المتبقى : ${widget.restVacation}',
                color: Colors.yellow[800],
                update: () async {
                  showUpdateDialog(update: () async {
                    Navigator.of(context);
                    await _firestore
                        .collection(widget.collectionName)
                        .document(widget.docId)
                        .updateData({
                      widget.field3: updatedValue,
                    });
                  });
                },
                showUpdateButton: widget.showUpdateButton,
              ),
      ],
    );
  }
}

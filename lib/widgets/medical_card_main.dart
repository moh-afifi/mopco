import 'package:flutter/material.dart';
import 'package:mopco/medical_section/medical_screen.dart';
import 'package:mopco/models/government_model.dart';

class MedicalCardMain extends StatelessWidget {
  MedicalCardMain({this.model});

  final Medical model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 18,
          margin: EdgeInsets.all(12),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicalScreen(
                      section: model.section,
                      name: model.name,
                    ),
                  ),
                );
              },
              title: Text(
                model.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              trailing: Image.asset(
                model.image,
                height: 35.0,
                width: 35.0,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}

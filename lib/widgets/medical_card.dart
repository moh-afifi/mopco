import 'package:flutter/material.dart';
import 'package:mopco/medical_section/medical_details.dart';

class MedicalCard extends StatelessWidget {
  MedicalCard(
      {this.name,
        this.address,
        this.phone1,
        this.phone3,
        this.phone2,
        this.lat,
        this.long});
  final String name, address, phone1, phone2, phone3, lat, long;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Card(
          elevation: 18,
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MedicalDetails(
                      name: name,
                      address: address,
                      lat: lat,
                      long: long,
                      phone1: phone1,
                      phone2: phone2,
                      phone3: phone3,
                    ),
                  ),
                );
              },
              title: Text(
                name,
                style: TextStyle(
                    color: Color(0xFF1E4F6F),
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                address,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              trailing: Image.asset(
                'images/employee.png',
                height: 50.0,
                width: 50.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
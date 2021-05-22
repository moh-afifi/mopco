import 'package:flutter/material.dart';
import 'package:mopco/phone_section/emp_data.dart';

class EmpCard extends StatelessWidget {
  EmpCard(
      {this.name,
      this.position,
      this.email,
      this.cisco,
      this.city,
      this.phone});

  final  name, position,email, city,phone, cisco;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Column(
        children: [
          Card(
            elevation: 18,
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(
                        email: email,
                        city: city,
                        cisco: cisco,
                        phone: phone,
                        name: name,
                        position: position,
                      ),
                    ),
                  );
                },
                title: (name == 'لا يوجد')
                    ? SizedBox()
                    : Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                subtitle: (position == 'لا يوجد'|| position == 0.toString() || position==0)
                    ? SizedBox()
                    : Text(
                  position,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                trailing: Image.asset(
                  'images/employee.png',
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white,
            endIndent: 75,
            indent: 75,
          ),
        ],
      ),
    );
  }
}

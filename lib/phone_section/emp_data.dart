import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/flutterProjects/projects/mopco/mopco/lib/widgets/info_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  final name, position, phone, cisco, email, city;

  Home(
      {this.name,
      this.position,
      this.email,
      this.cisco,
      this.city,
      this.phone});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 75,
                backgroundColor: Colors.grey[100],
                child: Image.asset(
                  'images/profile3.png',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              (name == '0' || name == '' || name == 'لا يوجد' || name == null)
                  ? SizedBox()
                  : Text(
                      name.toString(),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              (position == '0' ||
                      position == '' ||
                      position == 'لا يوجد' ||
                      position == null ||
                      position == 0)
                  ? SizedBox()
                  : Text(
                      position.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.teal[50],
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              Divider(
                color: Colors.white,
                endIndent: 75,
                indent: 75,
              ),
              (phone == '0' ||
                      phone == '' ||
                      phone == 'لا يوجد' ||
                      phone == null ||
                      phone == 0)
                  ? SizedBox()
                  : (phone.toString()[0] == '0')
                      ? InfoCard(
                          text: phone.toString(),
                          icon: Icons.phone,
                          onPressed: () async {
                            launch("tel://$phone");
                          })
                      : InfoCard(
                          text: '0$phone',
                          icon: Icons.phone,
                          onPressed: () async {
                            launch("tel://0$phone");
                          }),
              (email == '0' ||
                      email == '' ||
                      email == 'لا يوجد' ||
                      email == null ||
                      email == 0)
                  ? SizedBox()
                  : InfoCard(
                      text: email.toString(),
                      icon: Icons.email,
                      onPressed: () async {
                        launch('mailto:$email');
                      },
                    ),
              (cisco == '0' ||
                      cisco == '' ||
                      cisco == 'لا يوجد' ||
                      cisco == null ||
                      cisco == 0 ||
                      cisco == '.')
                  ? SizedBox()
                  : InfoCard(
                      text: cisco.toString(),
                      icon: Icons.phonelink,
                      onPressed: null,
                    ),
              (city == '0' || city == '' || city == 'لا يوجد' || city == null)
                  ? SizedBox()
                  : InfoCard(
                      text: city.toString(),
                      icon: Icons.location_on,
                      onPressed: null,
                    ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF1E4F6F),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/info_card.dart';
import 'package:mopco/widgets/medical_info_card.dart';

class MedicalDetails extends StatelessWidget {
  final String name, address, phone1, phone2, phone3, lat, long;

  MedicalDetails(
      {this.name,
      this.address,
      this.phone1,
      this.phone2,
      this.phone3,
      this.lat,
      this.long});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(75.0),
                //   child: Image.asset('images/index1.jpg',
                //     height: 150.0,
                //     width: 100.0,
                //   ),
                // ),
                Container(
                  width: 150.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(
                       Radius.circular(68.0),
                    ),
                  ),
                  child: Image(
                    image: AssetImage('images/index1.jpg'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    name,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    address,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal[50],
                      // letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.white,
                  endIndent: 75,
                  indent: 75,
                ),
                SizedBox(
                  height: 20,
                ),
                (phone1 == '0' ||
                        phone1 == '.' ||
                        phone1 == 'null' ||
                        phone1 == '-')
                    ? SizedBox()
                    : MedicalInfoCard(
                        text: phone1,
                        icon: Icons.phone,
                        onPressed: () async {}),
                (phone2 == '0' ||
                        phone2 == '.' ||
                        phone2 == 'null' ||
                        phone2 == '-')
                    ? SizedBox()
                    : MedicalInfoCard(
                        text: phone2,
                        icon: Icons.phone,
                        onPressed: () async {},
                      ),
                (phone3 == '0' ||
                        phone3 == '.' ||
                        phone3 == 'null' ||
                        phone3 == '-')
                    ? SizedBox()
                    : MedicalInfoCard(
                        text: phone3,
                        icon: Icons.phone,
                        onPressed: () async {},
                      ),
                InfoCard(
                  text: 'اضغط هنا',
                  icon: Icons.location_on_sharp,
                  onPressed: () {
                    MapUtils.openMap(
                      double.parse(lat),
                      double.parse(long),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFF1E4F6F),
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}

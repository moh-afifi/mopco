import 'package:flutter/material.dart';
import 'package:mopco/phone_section/phone_main.dart';
import 'package:mopco/app_screens/login.dart';
import 'package:mopco/medical_section/medical.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mopco/emp_vacations/choose_vacation_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mopco/widgets/drawer_list_tile.dart';
import 'package:connectivity/connectivity.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List titles = [
    'عن الشركة',
    'دليل الهاتف',
    'دليل الطبية',
    'اجازاتى',
    'تسجيل خروج'
  ];
  //------------------------------------------------
  Widget imageSlider = Container(
    height: 300,
    child: Carousel(
      boxFit: BoxFit.fill,
      images: [
        AssetImage('images/s1.JPG'),
        AssetImage('images/MOPCO675.jpg'),
        AssetImage('images/mopco2.JPG'),
        AssetImage('images/img1111.jpeg'),
        AssetImage('images/pic ashraf2.jpg'),
      ],
      autoplay: true,
      indicatorBgPadding: 1.0,
      dotBgColor: Colors.black,
      dotSize: 4.0,
    ),
  );

  //----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        title: Text(
          'MOPCO',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1E4F6F),
      ),
      body: ListView(
        children: <Widget>[
          imageSlider,
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'شركة مصر لإنتاج الأسمدة ( موبكو ) جزء من منظومة صناعة الأسمدة الأزوتية بجمهورية مصر العربية فقد تأسست عام 1998 وفقاً لأحكام قانون ضمانات وحوافز الاستــثمار رقم 8 لسنة 1997 داخل المنطقة الحرة العامة بدمــياط علي مســـاحة 400 ألف مــتر مربع مخصــص وبرأس مال يتجاوز اثنان ونصف مليار دولار مساهمة بين قطاع البترول والبنوك المصرية وشركات التأمين والمستثمرين العرب والأجانب والإكتتاب العام، و قد تم طرح أسهم الشركة بالبورصة المصرية فى سبتمبر 2016',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Builder(
            builder:(context)=>Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF1E4F6F),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('images/oil.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                DrawerListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.fiber_new_sharp,
                  label: titles[0],
                  textColor: Colors.purple,
                ),
                Divider(
                  color: Colors.black,
                ),
                DrawerListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PhoneScreen(),
                      ),
                    );
                  },
                  icon: Icons.contact_phone_outlined,
                  label: titles[1],
                  textColor: Colors.yellow[800],
                ),
                Divider(
                  color: Colors.black,
                ),
                DrawerListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MedicalScreen(),
                      ),
                    );
                  },
                  icon: Icons.medical_services_outlined,
                  label: titles[2],
                  textColor: Colors.blue,
                ),
                Divider(
                  color: Colors.black,
                ),
                DrawerListTile(
                  onTap: () async {
                    var connectivityResult =
                    await (Connectivity().checkConnectivity());
                    if ((connectivityResult != ConnectivityResult.mobile) &&
                        (connectivityResult != ConnectivityResult.wifi)) {
                      Navigator.pop(context);
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                        content: Text(
                          "No internet Connection",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17),
                        ),
                      ));
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChooseVacationType(),
                        ),
                      );
                    }
                  },
                  icon: Icons.card_travel_outlined,
                  label: titles[3],
                  textColor: Colors.teal[800],
                ),
                Divider(
                  color: Colors.black,
                ),
                DrawerListTile(
                  onTap: () async {
                    var connectivityResult =
                    await (Connectivity().checkConnectivity());
                    if ((connectivityResult != ConnectivityResult.mobile) &&
                        (connectivityResult != ConnectivityResult.wifi)) {
                      Navigator.pop(context);
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                        content: Text(
                          "No internet Connection",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17),
                        ),
                      ));
                    } else {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.remove('code');
                      //--------------------------------------------------------------
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen1(),
                        ),
                      );
                      //---------------------------------------------------------------
                    }
                  },
                  icon: Icons.logout,
                  label: titles[4],
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'dart:convert';
import 'package:mopco/models/full_details_model.dart';

FullDetailsModel fullDetailsList=FullDetailsModel();
class Model {
  final String title;
  final String image;
  final String section;

  Model({this.title, this.image, this.section});
}
void main() {
  String name="t.elseidy@mopco-eg.com ";
  List empNames=[
    {
      "names": "مها ابراهيم احمد كامل",
      "position": "مدير عام",
      "cisco": 4190,
      "phone": 1001797788,
      "email": "m.kamel@mopco-eg.com",
      "city": "القاهرة"
    },
    {
      "names": "الشيماء فتحي محمد محمد",
      "position": "مدير ادارة التنظيم و تخطيط القوي العاملة",
      "cisco": "لايوجد",
      "phone": "لايوجد",
      "email": "لايوجد",
      "city": "القاهرة"
    },
    {
      "names": "ياسر السيد محمد حسنين",
      "position": "مدير ادارة التنظيم و تخطيط القوي العاملة",
      "cisco": 4406,
      "phone": 1008620046,
      "email": "y.aboelsoud@mopco-eg.com",
      "city": "القاهرة"
    },
    {
      "names": "سمر احمد سعد احمد",
      "position": "مدير ادارة الاجراءات",
      "cisco": 4306,
      "phone": 1289551555,
      "email": "s.saad@mopco-eg.com",
      "city": "القاهرة"
    }
  ];
  // List<String > emails2=[
  //   'a.radwan@mopco-eg.com',
  //   'a.elnemr@mopco-eg.com',
  //   'a.rezk@mopco-eg.com',
  //   'a.hendawy@mopco-eg.com',
  //   'a.abdelfatah@mopco-eg.com',
  //   'e.yassen@mopco-eg.com',
  //   'a.alhendy@mopco-eg.com',
  //   'e.zaki@mopco-eg.com',
  //   'a.taraf@mopco-eg.com',
  //   'a.nashaat@mopco-eg.com',
  //   'e.abdelaziz@mopco-eg.com',
  //   'ah.salah@mopco-eg.com',
  //   'ahmed.mahmoud@mopco-eg.com',
  //   'a.eldomiaty@mopco-eg.com',
  //   'ezzat@Mopco-eg.com',
  //   'a.abdullah@mopco-eg.com',
  //   'a.ghareeb@mopco-eg.com',
  //   'e.rizk@mopco-eg.com',
  //   'a.berawy@mopco-eg.com',
  //   'ab.hamed@mopco-eg.com',
  //   'am.mohamed@mopco-eg.com',
  //   'a.mohammed@mopco-eg.com',
  //   'a.mashaal@mopco-eg.com',
  //   'a.mahrous@mopco-eg.com',
  //   'b.alaa@mopco-eg.com',
  //   'ay.abdelhamid@mopco-eg.com',
  //   'ab.elshahat@mopco-eg.com',
  //   'ay.ismaiel@mopco-eg.com',
  //   'g.amin@mopco-eg.com'];

  var names = [
    Model(
      title: 'السادة نواب ومساعدى الشركة',
      image: 'images/deputies.png',
      section: 't0',
    ),
    Model(
      title: 'الإدارة العامة للإعلام',
      image: 'images/media2.png',
      section: 't1',
    ),
    Model(
      title: 'الإدارة العامة لشئون العاملين والمزايا',
      image: 'images/HR.png',
      section: 't2',
    ),
    Model(
      title: 'الإدارة العامة للتمويل والعمليات المصرفية والإقتصادية',
      image: 'images/cash-flow.png',
      section: 't3',
    ),
    Model(
      title: 'الإدارة العامة للعقود والفتاوى',
      image: 'images/contract2.png',
      section: 't4',
    ),
    Model(
      title: 'الإدارة العامة لتكنولوجيا المعلومات والإتصالات',
      image: 'images/network.png',
      section: 't5',
    ),
    Model(
      title: 'الإدارة العامة للآمن',
      image: 'images/cctv.png',
      section: 't6',
    ),
    Model(
      title: 'الإدارة العامة للمراجعة',
      image: 'images/mwazna.png',
      section: 't7',
    ),
    Model(
      title: 'االإدارة العامة للخدمات المساعدة والنقل',
      image: 'images/ship2.png',
      section: 't8',
    ),
    Model(
      title: 'الإدارة العامة للدراسات الفنية والتطوير وترشيد الطاقة',
      image: 'images/plug.png',
      section: 't9',
    ),
    Model(
      title: 'الإدارة العامة للورش',
      image: 'images/wrsh.png',
      section: 't10',
    ),
    Model(
      title: 'الإدارة العامة للتحكم الآلى',
      image: 'images/machine-learning.png',
      section: 't11',
    ),
    Model(
      title: 'الادارة العامة للتنظيم',
      image: 'images/administrator.png',
      section: 't12',
    ),
    Model(
      title: 'سكرتارية السادة نواب ومساعدى الشركة',
      image: 'images/secretary2.png',
      section: 't13',
    ),
    Model(
      title: 'الإدارة العامة للمعلومات ودعم إتخاذ القرار',
      image: 'images/skills.png',
      section: 't14',
    ),
    Model(
      title: 'الإدارة العامة للتدريب',
      image: 'images/training.png',
      section: 't15',
    ),
    Model(
      title: 'الإدارة العامة للرعاية الطبية',
      image: 'images/health-check.png',
      section: 't16',
    ),
    Model(
      title: 'الإدارة العامة للحسابات والمراقبة المالية',
      image: 'images/financial-growth-48-1058881.png',
      section: 't17',
    ),
    Model(
      title: 'الإدارة العامة للقضايا والتحقيقات',
      image: 'images/briefcase.png',
      section: 't18',
    ),
    Model(
      title: 'الإدارة العامة للمشتريات',
      image: 'images/mshtryat.png',
      section: 't19',
    ),
    Model(
      title: 'الإدارة العامة للتسويق والمبيعات',
      image: 'images/marketing3.png',
      section: 't20',
    ),
    Model(
      title: 'الإدارة العامة للشئون الهندسية',
      image: 'images/architecture.png',
      section: 't21',
    ),
    Model(
      title: 'الإدارة العامة للسلامة والصحة المهنية وحماية البيئة',
      image: 'images/safety2.png',
      section: 't22',
    ),
    Model(
      title: 'الإدارة العامة للأمونيا والمرافق',
      image: 'images/amonia.jpg',
      section: 't23',
    ),
    Model(
      title: 'الإدرة العامة للكهرباء',
      image: 'images/electricity.jpg',
      section: 't24',
    ),
    Model(
      title: 'الإدارة العامة للأمانة العامة',
      image: 'images/الامانه.png',
      section: 't25',
    ),
    Model(
      title: 'الإدارة العامة للعلاقات العامة والإتصالات الحكومية',
      image: 'images/3lakat.png',
      section: 't26',
    ),
    Model(
      title: 'الإدارة العامة لخدمات المبنى الإدارى',
      image: 'images/service.png',
      section: 't27',
    ),
    Model(
      title: 'الإدارة العامة لعلاقات المستثمرين',
      image: 'images/PERSONNAL.jpg',
      section: 't28',
    ),
    Model(
      title: 'الإدارة العامة للموازنات والتكاليف',
      image: 'images/mwzna.png',
      section: 't29',
    ),
    Model(
      title: 'الإدارة العامة للمخازن',
      image: 'images/inventory.png',
      section: 't30',
    ),
    Model(
      title: 'الإدارة العامة للشحن والتخليص الجمركى',
      image: 'images/sha7n.jpg',
      section: 't31',
    ),
    Model(
      title: 'الإدارة العامة للتفتيش والجودة',
      image: 'images/text.png',
      section: 't32',
    ),
    Model(
      title: 'الإدارة العامة للصيانة الميكانيكية',
      image: 'images/service2.png',
      section: 't33',
    ),
    Model(
      title: 'الإدارة العامة لليوريا والتعبئة',
      image: 'images/urea.jpg',
      section: 't34',
    ),
    Model(
      title: 'الإدارة العامة للمعامل الكيماوية والبحوث',
      image: 'images/m3aml.png',
      section: 't35',
    ),
  ];

  List email=[];
  // for(int i =0 ;i<fullDetailsList.fullDetailsList.length;i++){
  //   String text=fullDetailsList.fullDetailsList[i]["الرقم"].toString();
  //   email.add("'$text'");
  // }

  for(int i=0;i<names.length;i++){
    String text=names[i].title;
    email.add("'$text'");
  }

  print(email);

//  User user = User.fromJson(jsonDecode(text));

//  print(user);


}

//class User {
//  String mail;
//
//  User(this.mail);
//
//  factory User.fromJson(dynamic json) {
//    return User(json["t.elseidy@mopco-eg.com"] as String);
//  }
//
//  @override
//  String toString() {
//    return '[ ${this.mail}]';
//  }
//}


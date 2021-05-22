class Model {
  final String title;
  final String icon;

  Model({this.title, this.icon});
}

class MedicalModel{
  var medicalList = [
    Model(
      title: 'دليل الخدمات الطبية بالقاهرة',
      icon: 'images/cairo2.png',
    ),
    Model(
      title: 'دليل الخدمات الطبية بدمياط',
      icon: 'images/damitta2.png',
    ),
    Model(
      title: 'دليل الخدمات الطبية ببورسعيد',
      icon: 'images/Port said.PNG',
    ),
    Model(
      title: 'دليل الخدمات الطبية بالمنصورة',
      icon: 'images/Mansoura.png',
    ),
    Model(
      title: 'دليل الخدمات الطبية بالإسكندرية',
      icon: 'images/alex.png',
    ),
    Model(
      title: 'دليل الخدمات الطبية بالسويس',
      icon: 'images/suez2.png',
    ),
  ];
}
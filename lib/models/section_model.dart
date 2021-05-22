class Model {
  final String title;
  final String image;
  final String section;

  Model({this.title, this.image, this.section});
}
class SectionModel{

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
      title: 'الإدارة العامة للخدمات المساعدة والنقل',
      image: 'images/ship2.png',
      section: 't3',
    ),
    Model(
      title: 'الإدارة العامة للتمويل والعمليات المصرفية والإقتصادية',
      image: 'images/cash-flow.png',
      section: 't4',
    ),
    Model(
      title: 'الإدارة العامة للعقود والفتاوى',
      image: 'images/contract2.png',
      section: 't29',
    ),
    Model(
      title: 'الإدارة العامة لتكنولوجيا المعلومات والإتصالات',
      image: 'images/network.png',
      section: 't6',
    ),
    Model(
      title: 'الإدارة العامة للآمن',
      image: 'images/cctv.png',
      section: 't7',
    ),
    Model(
      title: 'الإدارة العامة للمراجعة',
      image: 'images/mwazna.png',
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
      title: 'سكرتارية السادة نواب ومساعدى الشركة',
      image: 'images/secretary2.png',
      section: 't12',
    ),
    Model(
      title: 'الإدارة العامة للمعلومات ودعم إتخاذ القرار',
      image: 'images/skills.png',
      section: 't13',
    ),
    Model(
      title: 'الإدارة العامة للتدريب',
      image: 'images/training.png',
      section: 't14',
    ),
    Model(
      title: 'الإدارة العامة للرعاية الطبية',
      image: 'images/health-check.png',
      section: 't15',
    ),
    Model(
      title: 'الإدارة العامة للحسابات والمراقبة المالية',
      image: 'images/financial-growth-48-1058881.png',
      section: 't16',
    ),
    Model(
      title: 'الإدارة العامة للقضايا والتحقيقات',
      image: 'images/briefcase.png',
      section: 't17',
    ),
    Model(
      title: 'الإدارة العامة للمشتريات',
      image: 'images/mshtryat.png',
      section: 't18',
    ),
    Model(
      title: 'الإدارة العامة للتسويق والمبيعات',
      image: 'images/marketing3.png',
      section: 't19',
    ),
    Model(
      title: 'الإدارة العامة للشئون الهندسية',
      image: 'images/architecture.png',
      section: 't20',
    ),
    Model(
      title: 'الإدارة العامة للسلامة والصحة المهنية وحماية البيئة',
      image: 'images/safety2.png',
      section: 't21',
    ),
    Model(
      title: 'الإدارة العامة للأمونيا والمرافق',
      image: 'images/amonia.jpg',
      section: 't22',
    ),
    Model(
      title: 'الإدرة العامة للكهرباء',
      image: 'images/electricity.jpg',
      section: 't23',
    ),
    Model(
      title: 'الإدارة العامة للأمانة العامة',
      image: 'images/الامانه.png',
      section: 't24',
    ),
    Model(
      title: 'الإدارة العامة للعلاقات العامة والإتصالات الحكومية',
      image: 'images/3lakat.png',
      section: 't25',
    ),
    Model(
      title: 'الإدارة العامة لخدمات المبنى الإدارى',
      image: 'images/service.png',
      section: 't26',
    ),
    Model(
      title: 'الإدارة العامة لعلاقات المستثمرين',
      image: 'images/PERSONNAL.jpg',
      section: 't27',
    ),
    Model(
      title: 'الإدارة العامة للموازنات والتكاليف',
      image: 'images/mwzna.png',
      section: 't28',
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
    ),  Model(
      title: 'الادارة العامة للتنظيم',
      image: 'images/administrator.png',
      section: 't36',
    ),
  ];

  //-------------------------------------------------------------------
  List sectionList = [
    'السادة نواب ومساعدى الشركة',
    'الإدارة العامة للإعلام',
    'الإدارة العامة لشئون العاملين والمزايا',
    'الإدارة العامة للتمويل والعمليات المصرفية والإقتصادية',
    'الإدارة العامة للعقود والفتاوى',
    'الإدارة العامة لتكنولوجيا المعلومات والإتصالات',
    'الإدارة العامة للآمن',
    'الإدارة العامة للمراجعة',
    'الإدارة العامة للخدمات المساعدة والنقل',
    'الإدارة العامة للدراسات الفنية والتطوير وترشيد الطاقة',
    'الإدارة العامة للورش',
    'الإدارة العامة للتحكم الآلى',
    'الادارة العامة للتنظيم',
    'سكرتارية السادة نواب ومساعدى الشركة',
    'الإدارة العامة للمعلومات ودعم إتخاذ القرار',
    'الإدارة العامة للتدريب',
    'الإدارة العامة للرعاية الطبية',
    'الإدارة العامة للحسابات والمراقبة المالية',
    'الإدارة العامة للقضايا والتحقيقات',
    'الإدارة العامة للمشتريات',
    'الإدارة العامة للتسويق والمبيعات',
    'الإدارة العامة للشئون الهندسية',
    'الإدارة العامة للسلامة والصحة المهنية وحماية البيئة',
    'الإدارة العامة للأمونيا والمرافق',
    'الإدرة العامة للكهرباء',
    'الإدارة العامة للأمانة العامة',
    'الإدارة العامة للعلاقات العامة والإتصالات الحكومية',
    'الإدارة العامة لخدمات المبنى الإدارى',
    'الإدارة العامة لعلاقات المستثمرين',
    'الإدارة العامة للموازنات والتكاليف',
    'الإدارة العامة للمخازن',
    'الإدارة العامة للشحن والتخليص الجمركى',
    'الإدارة العامة للتفتيش والجودة',
    'الإدارة العامة للصيانة الميكانيكية',
    'الإدارة العامة لليوريا والتعبئة',
    'الإدارة العامة للمعامل الكيماوية والبحوث'
  ];
}
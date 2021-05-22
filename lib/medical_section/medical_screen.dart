import 'package:flutter/material.dart';
import 'package:mopco/widgets/medical_card.dart';
import 'package:mopco/models/new_medical_model.dart';

NewMedicalModel newMedicalModel = NewMedicalModel();

class MedicalScreen extends StatefulWidget {
  final String section, name;

  MedicalScreen({this.section, this.name});

  @override
  _MedicalScreenState createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {
  int myItemCount;

  getItemCount() {
    if (widget.section == 'mc0') {
      myItemCount = newMedicalModel.mc0.length;
    }else if(widget.section == 'mc1'){
      myItemCount = newMedicalModel.mc1.length;
    }else if(widget.section == 'mc2'){
      myItemCount = newMedicalModel.mc2.length;
    }else if(widget.section == 'mc3'){
      myItemCount = newMedicalModel.mc3.length;
    }else if(widget.section == 'mc4'){
      myItemCount = newMedicalModel.mc4.length;
    }else if(widget.section == 'mc5'){
      myItemCount = newMedicalModel.mc5.length;
    }else if(widget.section == 'mc6'){
      myItemCount = newMedicalModel.mc6.length;
    }else if(widget.section == 'mc7'){
      myItemCount = newMedicalModel.mc7.length;
    }else if(widget.section == 'md0'){
      myItemCount = newMedicalModel.md0.length;
    }else if(widget.section == 'md1'){
      myItemCount = newMedicalModel.md1.length;
    }else if(widget.section == 'md2'){
      myItemCount = newMedicalModel.md2.length;
    }else if(widget.section == 'md3'){
      myItemCount = newMedicalModel.md3.length;
    }else if(widget.section == 'md4'){
      myItemCount = newMedicalModel.md4.length;
    }else if(widget.section == 'md5'){
      myItemCount = newMedicalModel.md5.length;
    }else if(widget.section == 'md6'){
      myItemCount = newMedicalModel.md6.length;
    }else if(widget.section == 'md7'){
      myItemCount = newMedicalModel.md7.length;
    }else if(widget.section == 'md8'){
      myItemCount = newMedicalModel.md8.length;
    }else if(widget.section == 'mn0'){
      myItemCount = newMedicalModel.mn0.length;
    }else if(widget.section == 'mn1'){
      myItemCount = newMedicalModel.mn1.length;
    }else if(widget.section == 'mn2'){
      myItemCount = newMedicalModel.mn2.length;
    }else if(widget.section == 'mn3'){
      myItemCount = newMedicalModel.mn3.length;
    }else if(widget.section == 'mp0'){
      myItemCount = newMedicalModel.mp0.length;
    }else if(widget.section == 'mp1'){
      myItemCount = newMedicalModel.mp1.length;
    }else if(widget.section == 'mp2'){
      myItemCount = newMedicalModel.mp2.length;
    }else if(widget.section == 'mp3'){
      myItemCount = newMedicalModel.mp3.length;
    }else if(widget.section == 'mp4'){
      myItemCount = newMedicalModel.mp4.length;
    }else if(widget.section == 'ms0'){
      myItemCount = newMedicalModel.ms0.length;
    }else if(widget.section == 'ms1'){
      myItemCount = newMedicalModel.ms1.length;
    }else if(widget.section == 'ms2'){
      myItemCount = newMedicalModel.ms2.length;
    }else if(widget.section == 'ms3'){
      myItemCount = newMedicalModel.ms3.length;
    }else if(widget.section == 'ms3'){
      myItemCount = newMedicalModel.ms3.length;
    }else if(widget.section == 'ma0'){
      myItemCount = newMedicalModel.ma0.length;
    }else if(widget.section == 'ma1'){
      myItemCount = newMedicalModel.ma1.length;
    }else if(widget.section == 'ma2'){
      myItemCount = newMedicalModel.ma2.length;
    }else if(widget.section == 'ma3'){
      myItemCount = newMedicalModel.ma3.length;
    }else if(widget.section == 'ma4'){
      myItemCount = newMedicalModel.ma4.length;
    }else if(widget.section == 'ma5'){
      myItemCount = newMedicalModel.ma5.length;
    }
  }

  @override
  void initState() {
    getItemCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: Color(0xFF1E4F6F),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: myItemCount,
                itemBuilder: (context, index) {
                  if(widget.section=='mc0'){
                    return MedicalCard(
                      name: newMedicalModel.mc0[index]['name'],
                      address: newMedicalModel.mc0[index]['address'],
                      phone1: newMedicalModel.mc0[index]['phone1'],
                      phone2: newMedicalModel.mc0[index]['phone2'],
                      phone3: newMedicalModel.mc0[index]['phone3'],
                      lat: newMedicalModel.mc0[index]['lat'],
                      long: newMedicalModel.mc0[index]['long'],
                    );
                  }else if(widget.section=='mc1'){
                    return MedicalCard(
                      name: newMedicalModel.mc1[index]['name'],
                      address: newMedicalModel.mc1[index]['address'],
                      phone1: newMedicalModel.mc1[index]['phone1'],
                      phone2: newMedicalModel.mc1[index]['phone2'],
                      phone3: newMedicalModel.mc1[index]['phone3'],
                      lat: newMedicalModel.mc1[index]['lat'],
                      long: newMedicalModel.mc1[index]['long'],
                    );
                  }else if(widget.section=='mc2'){
                    return MedicalCard(
                      name: newMedicalModel.mc2[index]['name'],
                      address: newMedicalModel.mc2[index]['address'],
                      phone1: newMedicalModel.mc2[index]['phone1'],
                      phone2: newMedicalModel.mc2[index]['phone2'],
                      phone3: newMedicalModel.mc2[index]['phone3'],
                      lat: newMedicalModel.mc2[index]['lat'],
                      long: newMedicalModel.mc2[index]['long'],
                    );
                  }else if(widget.section=='mc3'){
                    return MedicalCard(
                      name: newMedicalModel.mc3[index]['name'],
                      address: newMedicalModel.mc3[index]['address'],
                      phone1: newMedicalModel.mc3[index]['phone1'],
                      phone2: newMedicalModel.mc3[index]['phone2'],
                      phone3: newMedicalModel.mc3[index]['phone3'],
                      lat: newMedicalModel.mc3[index]['lat'],
                      long: newMedicalModel.mc3[index]['long'],
                    );
                  }else if(widget.section=='mc4'){
                    return MedicalCard(
                      name: newMedicalModel.mc4[index]['name'],
                      address: newMedicalModel.mc4[index]['address'],
                      phone1: newMedicalModel.mc4[index]['phone1'],
                      phone2: newMedicalModel.mc4[index]['phone2'],
                      phone3: newMedicalModel.mc4[index]['phone3'],
                      lat: newMedicalModel.mc4[index]['lat'],
                      long: newMedicalModel.mc4[index]['long'],
                    );
                  }else if(widget.section=='mc5'){
                    return MedicalCard(
                      name: newMedicalModel.mc5[index]['name'],
                      address: newMedicalModel.mc5[index]['address'],
                      phone1: newMedicalModel.mc5[index]['phone1'],
                      phone2: newMedicalModel.mc5[index]['phone2'],
                      phone3: newMedicalModel.mc5[index]['phone3'],
                      lat: newMedicalModel.mc5[index]['lat'],
                      long: newMedicalModel.mc5[index]['long'],
                    );
                  }else if(widget.section=='mc6'){
                    return MedicalCard(
                      name: newMedicalModel.mc6[index]['name'],
                      address: newMedicalModel.mc6[index]['address'],
                      phone1: newMedicalModel.mc6[index]['phone1'],
                      phone2: newMedicalModel.mc6[index]['phone2'],
                      phone3: newMedicalModel.mc6[index]['phone3'],
                      lat: newMedicalModel.mc6[index]['lat'],
                      long: newMedicalModel.mc6[index]['long'],
                    );
                  }else if(widget.section=='mc7'){
                    return MedicalCard(
                      name: newMedicalModel.mc7[index]['name'],
                      address: newMedicalModel.mc7[index]['address'],
                      phone1: newMedicalModel.mc7[index]['phone1'],
                      phone2: newMedicalModel.mc7[index]['phone2'],
                      phone3: newMedicalModel.mc7[index]['phone3'],
                      lat: newMedicalModel.mc7[index]['lat'],
                      long: newMedicalModel.mc7[index]['long'],
                    );
                  }else if(widget.section=='md0'){
                    return MedicalCard(
                      name: newMedicalModel.md0[index]['name'],
                      address: newMedicalModel.md0[index]['address'],
                      phone1: newMedicalModel.md0[index]['phone1'],
                      phone2: newMedicalModel.md0[index]['phone2'],
                      phone3: newMedicalModel.md0[index]['phone3'],
                      lat: newMedicalModel.md0[index]['lat'],
                      long: newMedicalModel.md0[index]['long'],
                    );
                  }else if(widget.section=='md1'){
                    return MedicalCard(
                      name: newMedicalModel.md1[index]['name'],
                      address: newMedicalModel.md1[index]['address'],
                      phone1: newMedicalModel.md1[index]['phone1'],
                      phone2: newMedicalModel.md1[index]['phone2'],
                      phone3: newMedicalModel.md1[index]['phone3'],
                      lat: newMedicalModel.md1[index]['lat'],
                      long: newMedicalModel.md1[index]['long'],
                    );
                  }else if(widget.section=='md2'){
                    return MedicalCard(
                      name: newMedicalModel.md2[index]['name'],
                      address: newMedicalModel.md2[index]['address'],
                      phone1: newMedicalModel.md2[index]['phone1'],
                      phone2: newMedicalModel.md2[index]['phone2'],
                      phone3: newMedicalModel.md2[index]['phone3'],
                      lat: newMedicalModel.md2[index]['lat'],
                      long: newMedicalModel.md2[index]['long'],
                    );
                  }else if(widget.section=='md3'){
                    return MedicalCard(
                      name: newMedicalModel.md3[index]['name'],
                      address: newMedicalModel.md3[index]['address'],
                      phone1: newMedicalModel.md3[index]['phone1'],
                      phone2: newMedicalModel.md3[index]['phone2'],
                      phone3: newMedicalModel.md3[index]['phone3'],
                      lat: newMedicalModel.md3[index]['lat'],
                      long: newMedicalModel.md3[index]['long'],
                    );
                  }else if(widget.section=='md4'){
                    return MedicalCard(
                      name: newMedicalModel.md4[index]['name'],
                      address: newMedicalModel.md4[index]['address'],
                      phone1: newMedicalModel.md4[index]['phone1'],
                      phone2: newMedicalModel.md4[index]['phone2'],
                      phone3: newMedicalModel.md4[index]['phone3'],
                      lat: newMedicalModel.md4[index]['lat'],
                      long: newMedicalModel.md4[index]['long'],
                    );
                  }else if(widget.section=='md5'){
                    return MedicalCard(
                      name: newMedicalModel.md5[index]['name'],
                      address: newMedicalModel.md5[index]['address'],
                      phone1: newMedicalModel.md5[index]['phone1'],
                      phone2: newMedicalModel.md5[index]['phone2'],
                      phone3: newMedicalModel.md5[index]['phone3'],
                      lat: newMedicalModel.md5[index]['lat'],
                      long: newMedicalModel.md5[index]['long'],
                    );
                  }else if(widget.section=='md6'){
                    return MedicalCard(
                      name: newMedicalModel.md6[index]['name'],
                      address: newMedicalModel.md6[index]['address'],
                      phone1: newMedicalModel.md6[index]['phone1'],
                      phone2: newMedicalModel.md6[index]['phone2'],
                      phone3: newMedicalModel.md6[index]['phone3'],
                      lat: newMedicalModel.md6[index]['lat'],
                      long: newMedicalModel.md6[index]['long'],
                    );
                  }else if(widget.section=='md7'){
                    return MedicalCard(
                      name: newMedicalModel.md7[index]['name'],
                      address: newMedicalModel.md7[index]['address'],
                      phone1: newMedicalModel.md7[index]['phone1'],
                      phone2: newMedicalModel.md7[index]['phone2'],
                      phone3: newMedicalModel.md7[index]['phone3'],
                      lat: newMedicalModel.md7[index]['lat'],
                      long: newMedicalModel.md7[index]['long'],
                    );
                  }else if(widget.section=='md8'){
                    return MedicalCard(
                      name: newMedicalModel.md8[index]['name'],
                      address: newMedicalModel.md8[index]['address'],
                      phone1: newMedicalModel.md8[index]['phone1'],
                      phone2: newMedicalModel.md8[index]['phone2'],
                      phone3: newMedicalModel.md8[index]['phone3'],
                      lat: newMedicalModel.md8[index]['lat'],
                      long: newMedicalModel.md8[index]['long'],
                    );
                  }else if(widget.section=='mn0'){
                    return MedicalCard(
                      name: newMedicalModel.mn0[index]['name'],
                      address: newMedicalModel.mn0[index]['address'],
                      phone1: newMedicalModel.mn0[index]['phone1'],
                      phone2: newMedicalModel.mn0[index]['phone2'],
                      phone3: newMedicalModel.mn0[index]['phone3'],
                      lat: newMedicalModel.mn0[index]['lat'],
                      long: newMedicalModel.mn0[index]['long'],
                    );
                  }else if(widget.section=='mn1'){
                    return MedicalCard(
                      name: newMedicalModel.mn1[index]['name'],
                      address: newMedicalModel.mn1[index]['address'],
                      phone1: newMedicalModel.mn1[index]['phone1'],
                      phone2: newMedicalModel.mn1[index]['phone2'],
                      phone3: newMedicalModel.mn1[index]['phone3'],
                      lat: newMedicalModel.mn1[index]['lat'],
                      long: newMedicalModel.mn1[index]['long'],
                    );
                  }else if(widget.section=='mn2'){
                    return MedicalCard(
                      name: newMedicalModel.mn2[index]['name'],
                      address: newMedicalModel.mn2[index]['address'],
                      phone1: newMedicalModel.mn2[index]['phone1'],
                      phone2: newMedicalModel.mn2[index]['phone2'],
                      phone3: newMedicalModel.mn2[index]['phone3'],
                      lat: newMedicalModel.mn2[index]['lat'],
                      long: newMedicalModel.mn2[index]['long'],
                    );
                  }else if(widget.section=='mn3'){
                    return MedicalCard(
                      name: newMedicalModel.mn3[index]['name'],
                      address: newMedicalModel.mn3[index]['address'],
                      phone1: newMedicalModel.mn3[index]['phone1'],
                      phone2: newMedicalModel.mn3[index]['phone2'],
                      phone3: newMedicalModel.mn3[index]['phone3'],
                      lat: newMedicalModel.mn3[index]['lat'],
                      long: newMedicalModel.mn3[index]['long'],
                    );
                  }else if(widget.section=='mp0'){
                    return MedicalCard(
                      name: newMedicalModel.mp0[index]['name'],
                      address: newMedicalModel.mp0[index]['address'],
                      phone1: newMedicalModel.mp0[index]['phone1'],
                      phone2: newMedicalModel.mp0[index]['phone2'],
                      phone3: newMedicalModel.mp0[index]['phone3'],
                      lat: newMedicalModel.mp0[index]['lat'],
                      long: newMedicalModel.mp0[index]['long'],
                    );
                  }else if(widget.section=='mp1'){
                    return MedicalCard(
                      name: newMedicalModel.mp1[index]['name'],
                      address: newMedicalModel.mp1[index]['address'],
                      phone1: newMedicalModel.mp1[index]['phone1'],
                      phone2: newMedicalModel.mp1[index]['phone2'],
                      phone3: newMedicalModel.mp1[index]['phone3'],
                      lat: newMedicalModel.mp1[index]['lat'],
                      long: newMedicalModel.mp1[index]['long'],
                    );
                  }else if(widget.section=='mp2'){
                    return MedicalCard(
                      name: newMedicalModel.mp2[index]['name'],
                      address: newMedicalModel.mp2[index]['address'],
                      phone1: newMedicalModel.mp2[index]['phone1'],
                      phone2: newMedicalModel.mp2[index]['phone2'],
                      phone3: newMedicalModel.mp2[index]['phone3'],
                      lat: newMedicalModel.mp2[index]['lat'],
                      long: newMedicalModel.mp2[index]['long'],
                    );
                  }else if(widget.section=='mp3'){
                    return MedicalCard(
                      name: newMedicalModel.mp3[index]['name'],
                      address: newMedicalModel.mp3[index]['address'],
                      phone1: newMedicalModel.mp3[index]['phone1'],
                      phone2: newMedicalModel.mp3[index]['phone2'],
                      phone3: newMedicalModel.mp3[index]['phone3'],
                      lat: newMedicalModel.mp3[index]['lat'],
                      long: newMedicalModel.mp3[index]['long'],
                    );
                  }else if(widget.section=='mp4'){
                    return MedicalCard(
                      name: newMedicalModel.mp4[index]['name'],
                      address: newMedicalModel.mp4[index]['address'],
                      phone1: newMedicalModel.mp4[index]['phone1'],
                      phone2: newMedicalModel.mp4[index]['phone2'],
                      phone3: newMedicalModel.mp4[index]['phone3'],
                      lat: newMedicalModel.mp4[index]['lat'],
                      long: newMedicalModel.mp4[index]['long'],
                    );
                  }else if(widget.section=='ms0'){
                    return MedicalCard(
                      name: newMedicalModel.ms0[index]['name'],
                      address: newMedicalModel.ms0[index]['address'],
                      phone1: newMedicalModel.ms0[index]['phone1'],
                      phone2: newMedicalModel.ms0[index]['phone2'],
                      phone3: newMedicalModel.ms0[index]['phone3'],
                      lat: newMedicalModel.ms0[index]['lat'],
                      long: newMedicalModel.ms0[index]['long'],
                    );
                  }else if(widget.section=='ms1'){
                    return MedicalCard(
                      name: newMedicalModel.ms1[index]['name'],
                      address: newMedicalModel.ms1[index]['address'],
                      phone1: newMedicalModel.ms1[index]['phone1'],
                      phone2: newMedicalModel.ms1[index]['phone2'],
                      phone3: newMedicalModel.ms1[index]['phone3'],
                      lat: newMedicalModel.ms1[index]['lat'],
                      long: newMedicalModel.ms1[index]['long'],
                    );
                  }else if(widget.section=='ms2'){
                    return MedicalCard(
                      name: newMedicalModel.ms2[index]['name'],
                      address: newMedicalModel.ms2[index]['address'],
                      phone1: newMedicalModel.ms2[index]['phone1'],
                      phone2: newMedicalModel.ms2[index]['phone2'],
                      phone3: newMedicalModel.ms2[index]['phone3'],
                      lat: newMedicalModel.ms2[index]['lat'],
                      long: newMedicalModel.ms2[index]['long'],
                    );
                  }else if(widget.section=='ms3'){
                    return MedicalCard(
                      name: newMedicalModel.ms3[index]['name'],
                      address: newMedicalModel.ms3[index]['address'],
                      phone1: newMedicalModel.ms3[index]['phone1'],
                      phone2: newMedicalModel.ms3[index]['phone2'],
                      phone3: newMedicalModel.ms3[index]['phone3'],
                      lat: newMedicalModel.ms3[index]['lat'],
                      long: newMedicalModel.ms3[index]['long'],
                    );
                  }else if(widget.section=='ms4'){
                    return MedicalCard(
                      name: newMedicalModel.ms4[index]['name'],
                      address: newMedicalModel.ms4[index]['address'],
                      phone1: newMedicalModel.ms4[index]['phone1'],
                      phone2: newMedicalModel.ms4[index]['phone2'],
                      phone3: newMedicalModel.ms4[index]['phone3'],
                      lat: newMedicalModel.ms4[index]['lat'],
                      long: newMedicalModel.ms4[index]['long'],
                    );
                  }else if(widget.section=='ma0'){
                    return MedicalCard(
                      name: newMedicalModel.ma0[index]['name'],
                      address: newMedicalModel.ma0[index]['address'],
                      phone1: newMedicalModel.ma0[index]['phone1'],
                      phone2: newMedicalModel.ma0[index]['phone2'],
                      phone3: newMedicalModel.ma0[index]['phone3'],
                      lat: newMedicalModel.ma0[index]['lat'],
                      long: newMedicalModel.ma0[index]['long'],
                    );
                  }else if(widget.section=='ma1'){
                    return MedicalCard(
                      name: newMedicalModel.ma1[index]['name'],
                      address: newMedicalModel.ma1[index]['address'],
                      phone1: newMedicalModel.ma1[index]['phone1'],
                      phone2: newMedicalModel.ma1[index]['phone2'],
                      phone3: newMedicalModel.ma1[index]['phone3'],
                      lat: newMedicalModel.ma1[index]['lat'],
                      long: newMedicalModel.ma1[index]['long'],
                    );
                  }else if(widget.section=='ma2'){
                    return MedicalCard(
                      name: newMedicalModel.ma2[index]['name'],
                      address: newMedicalModel.ma2[index]['address'],
                      phone1: newMedicalModel.ma2[index]['phone1'],
                      phone2: newMedicalModel.ma2[index]['phone2'],
                      phone3: newMedicalModel.ma2[index]['phone3'],
                      lat: newMedicalModel.ma2[index]['lat'],
                      long: newMedicalModel.ma2[index]['long'],
                    );
                  }else if(widget.section=='ma3'){
                    return MedicalCard(
                      name: newMedicalModel.ma3[index]['name'],
                      address: newMedicalModel.ma3[index]['address'],
                      phone1: newMedicalModel.ma3[index]['phone1'],
                      phone2: newMedicalModel.ma3[index]['phone2'],
                      phone3: newMedicalModel.ma3[index]['phone3'],
                      lat: newMedicalModel.ma3[index]['lat'],
                      long: newMedicalModel.ma3[index]['long'],
                    );
                  }else if(widget.section=='ma4'){
                    return MedicalCard(
                      name: newMedicalModel.ma4[index]['name'],
                      address: newMedicalModel.ma4[index]['address'],
                      phone1: newMedicalModel.ma4[index]['phone1'],
                      phone2: newMedicalModel.ma4[index]['phone2'],
                      phone3: newMedicalModel.ma4[index]['phone3'],
                      lat: newMedicalModel.ma4[index]['lat'],
                      long: newMedicalModel.ma4[index]['long'],
                    );
                  }else if(widget.section=='ma5'){
                    return MedicalCard(
                      name: newMedicalModel.ma5[index]['name'],
                      address: newMedicalModel.ma5[index]['address'],
                      phone1: newMedicalModel.ma5[index]['phone1'],
                      phone2: newMedicalModel.ma5[index]['phone2'],
                      phone3: newMedicalModel.ma5[index]['phone3'],
                      lat: newMedicalModel.ma5[index]['lat'],
                      long: newMedicalModel.ma5[index]['long'],
                    );
                  }


                  return null;
                }),
          ),
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------

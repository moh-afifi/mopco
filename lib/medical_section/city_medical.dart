import 'package:flutter/material.dart';
import 'package:mopco/models/government_model.dart';
import 'package:mopco/widgets/medical_card_main.dart';

GovernmentModel governmentModel = GovernmentModel();

class CityMedical extends StatefulWidget {
  CityMedical({this.appBarTitle, this.title});

  final String appBarTitle, title;

  @override
  _CityMedicalState createState() => _CityMedicalState();
}

class _CityMedicalState extends State<CityMedical> {
  int myItemCount;

  getItemCount() {
    if (widget.title == 'دليل الخدمات الطبية بالقاهرة') {
      myItemCount = governmentModel.cairoList.length;
    } else if (widget.title == 'دليل الخدمات الطبية بدمياط') {
      myItemCount = governmentModel.damiettaList.length;
    }
    else if (widget.title == 'دليل الخدمات الطبية ببورسعيد'){
    myItemCount=governmentModel.portSaiedList.length;
    }else if(widget.title=='دليل الخدمات الطبية بالمنصورة'){
    myItemCount=governmentModel.mansouraList.length;
    }else if(widget.title=='دليل الخدمات الطبية بالإسكندرية') {
      myItemCount = governmentModel.alexList.length;
    } else if (widget.title == 'دليل الخدمات الطبية بالسويس') {
      myItemCount = governmentModel.suezList.length;
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
        backgroundColor: Color(0xFF1E4F6F),
        title: Text(
          widget.appBarTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: myItemCount,
                  itemBuilder: (ctx, index) {
                    if (widget.title == 'دليل الخدمات الطبية بالقاهرة') {
                      return MedicalCardMain(
                        model: governmentModel.cairoList[index],);
                    } else if (widget.title == 'دليل الخدمات الطبية بدمياط') {
                      return MedicalCardMain(
                        model: governmentModel.damiettaList[index],);
                    } else if (widget.title == 'دليل الخدمات الطبية ببورسعيد') {
                      return MedicalCardMain(
                        model: governmentModel.portSaiedList[index],);
                    } else if (widget.title == 'دليل الخدمات الطبية بالمنصورة') {
                      return MedicalCardMain(
                        model: governmentModel.mansouraList[index],);
                    } else if (widget.title == 'دليل الخدمات الطبية بالإسكندرية') {
                      return MedicalCardMain(
                        model: governmentModel.alexList[index],);
                    } else if (widget.title == 'دليل الخدمات الطبية بالسويس') {
                      return MedicalCardMain(
                        model: governmentModel.suezList[index],);
                    }
                    return null;
                  }

              )),
        ],
      ),
    );
  }
}

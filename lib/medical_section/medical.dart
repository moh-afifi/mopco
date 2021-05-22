import 'package:flutter/material.dart';
import 'package:mopco/models/medical_model.dart';
import 'package:mopco/medical_section/city_medical.dart';

MedicalModel medicalModel = MedicalModel();

class MedicalScreen extends StatefulWidget {
  @override
  _MedicalScreenState createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E4F6F),
        title: Text(
          'دليل الطبية ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (ctx, index) => item(medicalModel.medicalList[index],
                medicalModel.medicalList[index].title),
            itemCount: medicalModel.medicalList.length,
          )),
        ],
      ),
    );
  }

  Widget item(Model model, title) => Column(
        children: [
          Card(
            elevation: 18,
            child: ListTile(
              contentPadding: EdgeInsets.all(13.0),
              onTap: () {
                //Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CityMedical(
                      title: title,
                      appBarTitle: title,
                    ),
                  ),
                );
              },
              title: Text(
                model.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  model.icon,
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 5),
        ],
      );
}

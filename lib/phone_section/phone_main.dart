import 'package:flutter/material.dart';
import 'package:mopco/models/emp_model.dart';
import 'package:mopco/phone_section/emp_data.dart';
import 'package:mopco/phone_section/section_emps.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mopco/models/section_model.dart';

EmpData empData = EmpData();
SectionModel sectionModel = SectionModel();

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  String edara, appBarTitle;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  String name, phone, cisco, email, position, city;
  //--------------------------------------------------------
  validate(String val) {
    if (val.isEmpty) {
      return 'ادخل اسم الادارة او الموظف';
    }
  }
  //--------------------------------------------------------
  List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(modelEmp.sections.toSet().toList());
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches.toSet().toList();
  }
  //---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E4F6F),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E4F6F),
        title: Text(
          'دليل الهاتف ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) =>
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  child: Form(
                    key: this._formKey,
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Color(0xFF1E4F6F),
                                size: 35,
                              ),
                              onPressed: () {
                                // if (this._formKey.currentState.validate()) {
                                //   this._formKey.currentState.save();
                                //
                                //   if (modelEmp.names.contains(name)) {
                                //     for (int i = 0;
                                //         i < empData.empList.length;
                                //         i++) {
                                //       if (name == empData.empList[i]['Name']) {
                                //         email = empData.empList[i]['E-mail'];
                                //         city = empData.empList[i]['City'];
                                //         cisco = empData.empList[i]['Cisco'];
                                //         phone = empData.empList[i]['Phone'];
                                //         position = empData.empList[i]['Position'];
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //             builder: (context) => Home(
                                //               name: name,
                                //               email: email,
                                //               city: city,
                                //               cisco: cisco,
                                //               phone: phone,
                                //               position: position,
                                //             ),
                                //           ),
                                //         );
                                //       }
                                //     }
                                //   } else if (sectionModel.sectionList.contains(appBarTitle)) {
                                //     print('$appBarTitle*************************');
                                //     setState(() {});
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => EmployeeScreen(
                                //           section: edara,
                                //           edara: appBarTitle,
                                //         ),
                                //       ),
                                //     );
                                //   } else {
                                //     Scaffold.of(context).showSnackBar(new SnackBar(
                                //       backgroundColor: Colors.red,
                                //       duration: Duration(seconds: 3),
                                //       content: Text(
                                //         "name or department doesn\'t exist",
                                //         textAlign: TextAlign.center,
                                //         style: TextStyle(
                                //           fontSize: 18,
                                //         ),
                                //       ),
                                //     ));
                                //   }
                                // }
                              },
                            ),
                          ),
                          hintText: 'ادخل اسم الادارة او اسم الموظف',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: this._typeAheadController,
                      ),
                      suggestionsCallback: (pattern) {
                        return getSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        this._typeAheadController.text = suggestion;

                        if (this._formKey.currentState.validate()) {
                          this._formKey.currentState.save();

                          if (modelEmp.names.contains(name)) {
                            for (int i = 0; i < empData.empList.length; i++) {
                              if (name == empData.empList[i]['Name']) {
                                email = empData.empList[i]['E-mail'];
                                city = empData.empList[i]['City'];
                                cisco = empData.empList[i]['Cisco'];
                                phone = empData.empList[i]['Phone'];
                                position = empData.empList[i]['Position'];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Home(
                                          name: name,
                                          email: email,
                                          city: city,
                                          cisco: cisco,
                                          phone: phone,
                                          position: position,
                                        ),
                                  ),
                                );
                              }
                            }
                          } else
                          if (sectionModel.sectionList.contains(appBarTitle)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EmployeeScreen(
                                      section: edara,
                                      edara: appBarTitle,
                                    ),
                              ),
                            );
                          } else {
                            Scaffold.of(context).showSnackBar(new SnackBar(
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                              content: Text(
                                "name or department doesn\'t exist",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            );
                          }
                          _typeAheadController.clear();
                        }
                      },
                      validator: (value) {
                        return validate(value);
                      },
                      onSaved: (value) {
                        for (int i = 0; i < sectionModel.names.length; i++) {
                          if (sectionModel.names[i].title == value) {
                            edara = sectionModel.names[i].section;
                            appBarTitle = value;
                          } else {
                            name = value;
                          }
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) =>
                        item(sectionModel.names[index]),
                    itemCount: sectionModel.names.length,
                  ),
                ),
              ],
            ),
      ),
    );
  }

  Widget item(Model model) =>
      Column(
        children: [
          Card(
            elevation: 18,
            margin: EdgeInsets.all(15),
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EmployeeScreen(
                          section: model.section,
                          edara: model.title,
                        ),
                  ),
                );
              },
              title: Text(
                model.title,
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold
                  //fontSize: 20
                ),
              ),
              trailing: Image.asset(
                model.image,
                height: 38.0,
                width: 38.0,
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          )
        ],
      );
}

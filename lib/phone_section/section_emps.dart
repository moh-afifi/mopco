import 'package:flutter/material.dart';
import 'package:mopco/phone_section/emp_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mopco/widgets/emp_card.dart';
import 'package:mopco/models/data_model_new.dart';
import 'package:mopco/models/model.dart';

DataModelNew dataModelNew = DataModelNew();
ModelEmp modelEmp = ModelEmp();

class EmployeeScreen extends StatefulWidget {
  final String section, name, position, phone, cisco, email, city, edara;

  EmployeeScreen(
      {this.section,
      this.name,
      this.position,
      this.city,
      this.cisco,
      this.email,
      this.phone,
      this.edara});

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  var name, position, city, email, cisco, phone;

//----------------------------------
  int itemCountListView;

  getItemCount() {
    if (widget.section == 't0') {
      itemCountListView = dataModelNew.t0.length;
    } else if (widget.section == 't1') {
      itemCountListView = dataModelNew.t1.length;
    } else if (widget.section == 't2') {
      itemCountListView = dataModelNew.t2.length;
    } else if (widget.section == 't3') {
      itemCountListView = dataModelNew.t3.length;
    } else if (widget.section == 't4') {
      itemCountListView = dataModelNew.t4.length;
    } else if (widget.section == 't6') {
      itemCountListView = dataModelNew.t6.length;
    } else if (widget.section == 't7') {
      itemCountListView = dataModelNew.t7.length;
    } else if (widget.section == 't8') {
      itemCountListView = dataModelNew.t8.length;
    } else if (widget.section == 't9') {
      itemCountListView = dataModelNew.t9.length;
    } else if (widget.section == 't10') {
      itemCountListView = dataModelNew.t10.length;
    } else if (widget.section == 't11') {
      itemCountListView = dataModelNew.t11.length;
    } else if (widget.section == 't12') {
      itemCountListView = dataModelNew.t12.length;
    } else if (widget.section == 't13') {
      itemCountListView = dataModelNew.t13.length;
    } else if (widget.section == 't14') {
      itemCountListView = dataModelNew.t14.length;
    } else if (widget.section == 't15') {
      itemCountListView = dataModelNew.t15.length;
    } else if (widget.section == 't16') {
      itemCountListView = dataModelNew.t16.length;
    } else if (widget.section == 't17') {
      itemCountListView = dataModelNew.t17.length;
    } else if (widget.section == 't18') {
      itemCountListView = dataModelNew.t18.length;
    } else if (widget.section == 't19') {
      itemCountListView = dataModelNew.t19.length;
    } else if (widget.section == 't20') {
      itemCountListView = dataModelNew.t20.length;
    } else if (widget.section == 't21') {
      itemCountListView = dataModelNew.t21.length;
    } else if (widget.section == 't22') {
      itemCountListView = dataModelNew.t22.length;
    } else if (widget.section == 't23') {
      itemCountListView = dataModelNew.t23.length;
    } else if (widget.section == 't24') {
      itemCountListView = dataModelNew.t24.length;
    } else if (widget.section == 't25') {
      itemCountListView = dataModelNew.t25.length;
    } else if (widget.section == 't26') {
      itemCountListView = dataModelNew.t26.length;
    } else if (widget.section == 't27') {
      itemCountListView = dataModelNew.t27.length;
    } else if (widget.section == 't28') {
      itemCountListView = dataModelNew.t28.length;
    } else if (widget.section == 't29') {
      itemCountListView = dataModelNew.t29.length;
    } else if (widget.section == 't30') {
      itemCountListView = dataModelNew.t30.length;
    } else if (widget.section == 't31') {
      itemCountListView = dataModelNew.t31.length;
    } else if (widget.section == 't32') {
      itemCountListView = dataModelNew.t32.length;
    } else if (widget.section == 't33') {
      itemCountListView = dataModelNew.t33.length;
    } else if (widget.section == 't34') {
      itemCountListView = dataModelNew.t34.length;
    } else if (widget.section == 't35') {
      itemCountListView = dataModelNew.t35.length;
    } else if (widget.section == 't36') {
      itemCountListView = dataModelNew.t36.length;
    }
  }

  List<String> getSuggestions(String query) {
    if (widget.section == 't0') {
      matches.addAll(modelEmp.t0.toSet().toList());
    } else if (widget.section == 't1') {
      matches.addAll(modelEmp.t1.toSet().toList());
    } else if (widget.section == 't2') {
      matches.addAll(modelEmp.t2.toSet().toList());
    } else if (widget.section == 't3') {
      matches.addAll(modelEmp.t3.toSet().toList());
    } else if (widget.section == 't4') {
      matches.addAll(modelEmp.t4.toSet().toList());
    } else if (widget.section == 't5') {
      matches.addAll(modelEmp.t5.toSet().toList());
    } else if (widget.section == 't6') {
      matches.addAll(modelEmp.t6.toSet().toList());
    } else if (widget.section == 't7') {
      matches.addAll(modelEmp.t7.toSet().toList());
    } else if (widget.section == 't8') {
      matches.addAll(modelEmp.t8.toSet().toList());
    } else if (widget.section == 't9') {
      matches.addAll(modelEmp.t9.toSet().toList());
    } else if (widget.section == 't10') {
      matches.addAll(modelEmp.t10.toSet().toList());
    } else if (widget.section == 't11') {
      matches.addAll(modelEmp.t11.toSet().toList());
    } else if (widget.section == 't12') {
      matches.addAll(modelEmp.t12.toSet().toList());
    } else if (widget.section == 't13') {
      matches.addAll(modelEmp.t13.toSet().toList());
    } else if (widget.section == 't14') {
      matches.addAll(modelEmp.t14.toSet().toList());
    } else if (widget.section == 't15') {
      matches.addAll(modelEmp.t15.toSet().toList());
    } else if (widget.section == 't16') {
      matches.addAll(modelEmp.t16.toSet().toList());
    } else if (widget.section == 't17') {
      matches.addAll(modelEmp.t17.toSet().toList());
    } else if (widget.section == 't18') {
      matches.addAll(modelEmp.t18.toSet().toList());
    } else if (widget.section == 't19') {
      matches.addAll(modelEmp.t19.toSet().toList());
    } else if (widget.section == 't20') {
      matches.addAll(modelEmp.t20.toSet().toList());
    } else if (widget.section == 't21') {
      matches.addAll(modelEmp.t21.toSet().toList());
    } else if (widget.section == 't22') {
      matches.addAll(modelEmp.t22.toSet().toList());
    } else if (widget.section == 't23') {
      matches.addAll(modelEmp.t23.toSet().toList());
    } else if (widget.section == 't24') {
      matches.addAll(modelEmp.t24.toSet().toList());
    } else if (widget.section == '25') {
      matches.addAll(modelEmp.t25.toSet().toList());
    } else if (widget.section == 't26') {
      matches.addAll(modelEmp.t26.toSet().toList());
    } else if (widget.section == 't27') {
      matches.addAll(modelEmp.t27.toSet().toList());
    } else if (widget.section == 't28') {
      matches.addAll(modelEmp.t28.toSet().toList());
    } else if (widget.section == 't29') {
      matches.addAll(modelEmp.t29.toSet().toList());
    } else if (widget.section == 't30') {
      matches.addAll(modelEmp.t30.toSet().toList());
    } else if (widget.section == 't31') {
      matches.addAll(modelEmp.t31.toSet().toList());
    } else if (widget.section == 't32') {
      matches.addAll(modelEmp.t32.toSet().toList());
    } else if (widget.section == 't33') {
      matches.addAll(modelEmp.t33.toSet().toList());
    } else if (widget.section == 't34') {
      matches.addAll(modelEmp.t34.toSet().toList());
    } else if (widget.section == 't35') {
      matches.addAll(modelEmp.t35.toSet().toList());
    } else if (widget.section == 't36') {
      matches.addAll(modelEmp.t36.toSet().toList());
    }
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches.toSet().toList();
  }

  validate(String val) {
    if (val.isEmpty) {
      return 'ادخل اسم الموظف';
    }
  }

  List<String> matches = List();

  @override
  void initState() {
    getItemCount();
    super.initState();
  }

  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E4F6F),
        centerTitle: true,
        title: Text(
          widget.edara,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color(0xFF1E4F6F),
      body: Column(
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
                          //   if(!matches.contains(name2)){
                          //     Scaffold.of(context).showSnackBar(new SnackBar(
                          //       backgroundColor: Colors.red,
                          //       duration: Duration(seconds: 3),
                          //       content: Text(
                          //         "name doesn\'t exist",
                          //         textAlign: TextAlign.center,
                          //         style: TextStyle(
                          //           fontSize: 18,
                          //         ),
                          //       ),
                          //     ));
                          //   }else{
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => Home(
                          //           position: position2,
                          //           name: name2,
                          //           phone: phone2,
                          //           cisco: cisco2,
                          //           city: city2,
                          //           email: email2,
                          //         ),
                          //       ),
                          //     );
                          //   }
                          //
                          //
                          // }
                        },
                      ),
                    ),
                    hintText: 'ادخل اسم الموظف',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(
                          position: position,
                          name: name,
                          phone: phone,
                          cisco: cisco,
                          city: city,
                          email: email,
                        ),
                      ),
                    );
                  }
                },
                validator: (value) {
                  return validate(value);
                },
                onSaved: (value) {
                  name = value;
                  if (widget.section == 't0') {
                    for (int i = 0; i < dataModelNew.t0.length; i++) {
                      if (name == dataModelNew.t0[i]['names']) {
                        position = dataModelNew.t0[i]['position'];
                        phone = dataModelNew.t0[i]['phone'];
                        cisco = dataModelNew.t0[i]['cisco'];
                        city = dataModelNew.t0[i]['city'];
                        email = dataModelNew.t0[i]['email'];
                      }
                    }
                  } else if (widget.section == 't1') {
                    for (int i = 0; i < dataModelNew.t1.length; i++) {
                      if (name == dataModelNew.t1[i]['names']) {
                        position = dataModelNew.t1[i]['position'];
                        phone = dataModelNew.t1[i]['phone'];
                        cisco = dataModelNew.t1[i]['cisco'];
                        city = dataModelNew.t1[i]['city'];
                        email = dataModelNew.t1[i]['email'];
                      }
                    }
                  } else if (widget.section == 't2') {
                    for (int i = 0; i < dataModelNew.t2.length; i++) {
                      if (name == dataModelNew.t2[i]['names']) {
                        position = dataModelNew.t2[i]['position'];
                        phone = dataModelNew.t2[i]['phone'];
                        cisco = dataModelNew.t2[i]['cisco'];
                        city = dataModelNew.t2[i]['city'];
                        email = dataModelNew.t2[i]['email'];
                      }
                    }
                  } else if (widget.section == 't3') {
                    for (int i = 0; i < dataModelNew.t3.length; i++) {
                      if (name == dataModelNew.t3[i]['names']) {
                        position = dataModelNew.t3[i]['position'];
                        phone = dataModelNew.t3[i]['phone'];
                        cisco = dataModelNew.t3[i]['cisco'];
                        city = dataModelNew.t3[i]['city'];
                        email = dataModelNew.t3[i]['email'];
                      }
                    }
                  } else if (widget.section == 't4') {
                    for (int i = 0; i < dataModelNew.t4.length; i++) {
                      if (name == dataModelNew.t4[i]['names']) {
                        position = dataModelNew.t4[i]['position'];
                        phone = dataModelNew.t4[i]['phone'];
                        cisco = dataModelNew.t4[i]['cisco'];
                        city = dataModelNew.t4[i]['city'];
                        email = dataModelNew.t4[i]['email'];
                      }
                    }
                  } else if (widget.section == 't6') {
                    for (int i = 0; i < dataModelNew.t6.length; i++) {
                      if (name == dataModelNew.t6[i]['names']) {
                        position = dataModelNew.t6[i]['position'];
                        phone = dataModelNew.t6[i]['phone'];
                        cisco = dataModelNew.t6[i]['cisco'];
                        city = dataModelNew.t6[i]['city'];
                        email = dataModelNew.t6[i]['email'];
                      }
                    }
                  } else if (widget.section == 't7') {
                    for (int i = 0; i < dataModelNew.t7.length; i++) {
                      if (name == dataModelNew.t7[i]['names']) {
                        position = dataModelNew.t7[i]['position'];
                        phone = dataModelNew.t7[i]['phone'];
                        cisco = dataModelNew.t7[i]['cisco'];
                        city = dataModelNew.t7[i]['city'];
                        email = dataModelNew.t7[i]['email'];
                      }
                    }
                  } else if (widget.section == 't8') {
                    for (int i = 0; i < dataModelNew.t8.length; i++) {
                      if (name == dataModelNew.t8[i]['names']) {
                        position = dataModelNew.t8[i]['position'];
                        phone = dataModelNew.t8[i]['phone'];
                        cisco = dataModelNew.t8[i]['cisco'];
                        city = dataModelNew.t8[i]['city'];
                        email = dataModelNew.t8[i]['email'];
                      }
                    }
                  } else if (widget.section == 't9') {
                    for (int i = 0; i < dataModelNew.t9.length; i++) {
                      if (name == dataModelNew.t9[i]['names']) {
                        position = dataModelNew.t9[i]['position'];
                        phone = dataModelNew.t9[i]['phone'];
                        cisco = dataModelNew.t9[i]['cisco'];
                        city = dataModelNew.t9[i]['city'];
                        email = dataModelNew.t9[i]['email'];
                      }
                    }
                  } else if (widget.section == 't10') {
                    for (int i = 0; i < dataModelNew.t10.length; i++) {
                      if (name == dataModelNew.t10[i]['names']) {
                        position = dataModelNew.t10[i]['position'];
                        phone = dataModelNew.t10[i]['phone'];
                        cisco = dataModelNew.t10[i]['cisco'];
                        city = dataModelNew.t10[i]['city'];
                        email = dataModelNew.t10[i]['email'];
                      }
                    }
                  } else if (widget.section == 't11') {
                    for (int i = 0; i < dataModelNew.t11.length; i++) {
                      if (name == dataModelNew.t11[i]['names']) {
                        position = dataModelNew.t11[i]['position'];
                        phone = dataModelNew.t11[i]['phone'];
                        cisco = dataModelNew.t11[i]['cisco'];
                        city = dataModelNew.t11[i]['city'];
                        email = dataModelNew.t11[i]['email'];
                      }
                    }
                  } else if (widget.section == 't12') {
                    for (int i = 0; i < dataModelNew.t12.length; i++) {
                      if (name == dataModelNew.t12[i]['names']) {
                        position = dataModelNew.t12[i]['position'];
                        phone = dataModelNew.t12[i]['phone'];
                        cisco = dataModelNew.t12[i]['cisco'];
                        city = dataModelNew.t12[i]['city'];
                        email = dataModelNew.t12[i]['email'];
                      }
                    }
                  } else if (widget.section == 't13') {
                    for (int i = 0; i < dataModelNew.t13.length; i++) {
                      if (name == dataModelNew.t13[i]['names']) {
                        position = dataModelNew.t13[i]['position'];
                        phone = dataModelNew.t13[i]['phone'];
                        cisco = dataModelNew.t13[i]['cisco'];
                        city = dataModelNew.t13[i]['city'];
                        email = dataModelNew.t13[i]['email'];
                      }
                    }
                  } else if (widget.section == 't14') {
                    for (int i = 0; i < dataModelNew.t14.length; i++) {
                      if (name == dataModelNew.t14[i]['names']) {
                        position = dataModelNew.t14[i]['position'];
                        phone = dataModelNew.t14[i]['phone'];
                        cisco = dataModelNew.t14[i]['cisco'];
                        city = dataModelNew.t14[i]['city'];
                        email = dataModelNew.t14[i]['email'];
                      }
                    }
                  } else if (widget.section == 't15') {
                    for (int i = 0; i < dataModelNew.t15.length; i++) {
                      if (name == dataModelNew.t15[i]['names']) {
                        position = dataModelNew.t15[i]['position'];
                        phone = dataModelNew.t15[i]['phone'];
                        cisco = dataModelNew.t15[i]['cisco'];
                        city = dataModelNew.t15[i]['city'];
                        email = dataModelNew.t15[i]['email'];
                      }
                    }
                  } else if (widget.section == 't16') {
                    for (int i = 0; i < dataModelNew.t16.length; i++) {
                      if (name == dataModelNew.t16[i]['names']) {
                        position = dataModelNew.t16[i]['position'];
                        phone = dataModelNew.t16[i]['phone'];
                        cisco = dataModelNew.t16[i]['cisco'];
                        city = dataModelNew.t16[i]['city'];
                        email = dataModelNew.t16[i]['email'];
                      }
                    }
                  } else if (widget.section == 't17') {
                    for (int i = 0; i < dataModelNew.t17.length; i++) {
                      if (name == dataModelNew.t17[i]['names']) {
                        position = dataModelNew.t17[i]['position'];
                        phone = dataModelNew.t17[i]['phone'];
                        cisco = dataModelNew.t17[i]['cisco'];
                        city = dataModelNew.t17[i]['city'];
                        email = dataModelNew.t17[i]['email'];
                      }
                    }
                  } else if (widget.section == 't18') {
                    for (int i = 0; i < dataModelNew.t18.length; i++) {
                      if (name == dataModelNew.t18[i]['names']) {
                        position = dataModelNew.t18[i]['position'];
                        phone = dataModelNew.t18[i]['phone'];
                        cisco = dataModelNew.t18[i]['cisco'];
                        city = dataModelNew.t18[i]['city'];
                        email = dataModelNew.t18[i]['email'];
                      }
                    }
                  } else if (widget.section == 't19') {
                    for (int i = 0; i < dataModelNew.t19.length; i++) {
                      if (name == dataModelNew.t19[i]['names']) {
                        position = dataModelNew.t19[i]['position'];
                        phone = dataModelNew.t19[i]['phone'];
                        cisco = dataModelNew.t19[i]['cisco'];
                        city = dataModelNew.t19[i]['city'];
                        email = dataModelNew.t19[i]['email'];
                      }
                    }
                  } else if (widget.section == 't20') {
                    for (int i = 0; i < dataModelNew.t20.length; i++) {
                      if (name == dataModelNew.t20[i]['names']) {
                        position = dataModelNew.t20[i]['position'];
                        phone = dataModelNew.t20[i]['phone'];
                        cisco = dataModelNew.t20[i]['cisco'];
                        city = dataModelNew.t20[i]['city'];
                        email = dataModelNew.t20[i]['email'];
                      }
                    }
                  } else if (widget.section == 't21') {
                    for (int i = 0; i < dataModelNew.t21.length; i++) {
                      if (name == dataModelNew.t21[i]['names']) {
                        position = dataModelNew.t21[i]['position'];
                        phone = dataModelNew.t21[i]['phone'];
                        cisco = dataModelNew.t21[i]['cisco'];
                        city = dataModelNew.t21[i]['city'];
                        email = dataModelNew.t21[i]['email'];
                      }
                    }
                  } else if (widget.section == 't22') {
                    for (int i = 0; i < dataModelNew.t22.length; i++) {
                      if (name == dataModelNew.t22[i]['names']) {
                        position = dataModelNew.t22[i]['position'];
                        phone = dataModelNew.t22[i]['phone'];
                        cisco = dataModelNew.t22[i]['cisco'];
                        city = dataModelNew.t22[i]['city'];
                        email = dataModelNew.t22[i]['email'];
                      }
                    }
                  } else if (widget.section == 't23') {
                    for (int i = 0; i < dataModelNew.t23.length; i++) {
                      if (name == dataModelNew.t23[i]['names']) {
                        position = dataModelNew.t23[i]['position'];
                        phone = dataModelNew.t23[i]['phone'];
                        cisco = dataModelNew.t23[i]['cisco'];
                        city = dataModelNew.t23[i]['city'];
                        email = dataModelNew.t23[i]['email'];
                      }
                    }
                  } else if (widget.section == 't24') {
                    for (int i = 0; i < dataModelNew.t24.length; i++) {
                      if (name == dataModelNew.t24[i]['names']) {
                        position = dataModelNew.t24[i]['position'];
                        phone = dataModelNew.t24[i]['phone'];
                        cisco = dataModelNew.t24[i]['cisco'];
                        city = dataModelNew.t24[i]['city'];
                        email = dataModelNew.t24[i]['email'];
                      }
                    }
                  } else if (widget.section == 't25') {
                    for (int i = 0; i < dataModelNew.t25.length; i++) {
                      if (name == dataModelNew.t25[i]['names']) {
                        position = dataModelNew.t25[i]['position'];
                        phone = dataModelNew.t25[i]['phone'];
                        cisco = dataModelNew.t25[i]['cisco'];
                        city = dataModelNew.t25[i]['city'];
                        email = dataModelNew.t25[i]['email'];
                      }
                    }
                  } else if (widget.section == 't26') {
                    for (int i = 0; i < dataModelNew.t26.length; i++) {
                      if (name == dataModelNew.t26[i]['names']) {
                        position = dataModelNew.t26[i]['position'];
                        phone = dataModelNew.t26[i]['phone'];
                        cisco = dataModelNew.t26[i]['cisco'];
                        city = dataModelNew.t26[i]['city'];
                        email = dataModelNew.t26[i]['email'];
                      }
                    }
                  } else if (widget.section == 't27') {
                    for (int i = 0; i < dataModelNew.t27.length; i++) {
                      if (name == dataModelNew.t27[i]['names']) {
                        position = dataModelNew.t27[i]['position'];
                        phone = dataModelNew.t27[i]['phone'];
                        cisco = dataModelNew.t27[i]['cisco'];
                        city = dataModelNew.t27[i]['city'];
                        email = dataModelNew.t27[i]['email'];
                      }
                    }
                  } else if (widget.section == 't28') {
                    for (int i = 0; i < dataModelNew.t28.length; i++) {
                      if (name == dataModelNew.t28[i]['names']) {
                        position = dataModelNew.t28[i]['position'];
                        phone = dataModelNew.t28[i]['phone'];
                        cisco = dataModelNew.t28[i]['cisco'];
                        city = dataModelNew.t28[i]['city'];
                        email = dataModelNew.t28[i]['email'];
                      }
                    }
                  } else if (widget.section == 't29') {
                    for (int i = 0; i < dataModelNew.t29.length; i++) {
                      if (name == dataModelNew.t29[i]['names']) {
                        position = dataModelNew.t29[i]['position'];
                        phone = dataModelNew.t29[i]['phone'];
                        cisco = dataModelNew.t29[i]['cisco'];
                        city = dataModelNew.t29[i]['city'];
                        email = dataModelNew.t29[i]['email'];
                      }
                    }
                  } else if (widget.section == 't30') {
                    for (int i = 0; i < dataModelNew.t30.length; i++) {
                      if (name == dataModelNew.t30[i]['names']) {
                        position = dataModelNew.t30[i]['position'];
                        phone = dataModelNew.t30[i]['phone'];
                        cisco = dataModelNew.t30[i]['cisco'];
                        city = dataModelNew.t30[i]['city'];
                        email = dataModelNew.t30[i]['email'];
                      }
                    }
                  } else if (widget.section == 't31') {
                    for (int i = 0; i < dataModelNew.t31.length; i++) {
                      if (name == dataModelNew.t31[i]['names']) {
                        position = dataModelNew.t31[i]['position'];
                        phone = dataModelNew.t31[i]['phone'];
                        cisco = dataModelNew.t31[i]['cisco'];
                        city = dataModelNew.t31[i]['city'];
                        email = dataModelNew.t31[i]['email'];
                      }
                    }
                  } else if (widget.section == 't32') {
                    for (int i = 0; i < dataModelNew.t32.length; i++) {
                      if (name == dataModelNew.t32[i]['names']) {
                        position = dataModelNew.t32[i]['position'];
                        phone = dataModelNew.t32[i]['phone'];
                        cisco = dataModelNew.t32[i]['cisco'];
                        city = dataModelNew.t32[i]['city'];
                        email = dataModelNew.t32[i]['email'];
                      }
                    }
                  } else if (widget.section == 't33') {
                    for (int i = 0; i < dataModelNew.t33.length; i++) {
                      if (name == dataModelNew.t33[i]['names']) {
                        position = dataModelNew.t33[i]['position'];
                        phone = dataModelNew.t33[i]['phone'];
                        cisco = dataModelNew.t33[i]['cisco'];
                        city = dataModelNew.t33[i]['city'];
                        email = dataModelNew.t33[i]['email'];
                      }
                    }
                  } else if (widget.section == 't34') {
                    for (int i = 0; i < dataModelNew.t34.length; i++) {
                      if (name == dataModelNew.t34[i]['names']) {
                        position = dataModelNew.t34[i]['position'];
                        phone = dataModelNew.t34[i]['phone'];
                        cisco = dataModelNew.t34[i]['cisco'];
                        city = dataModelNew.t34[i]['city'];
                        email = dataModelNew.t34[i]['email'];
                      }
                    }
                  } else if (widget.section == 't35') {
                    for (int i = 0; i < dataModelNew.t35.length; i++) {
                      if (name == dataModelNew.t35[i]['names']) {
                        position = dataModelNew.t35[i]['position'];
                        phone = dataModelNew.t35[i]['phone'];
                        cisco = dataModelNew.t35[i]['cisco'];
                        city = dataModelNew.t35[i]['city'];
                        email = dataModelNew.t35[i]['email'];
                      }
                    }
                  } else if (widget.section == 't36') {
                    for (int i = 0; i < dataModelNew.t36.length; i++) {
                      if (name == dataModelNew.t36[i]['names']) {
                        position = dataModelNew.t36[i]['position'];
                        phone = dataModelNew.t36[i]['phone'];
                        cisco = dataModelNew.t36[i]['cisco'];
                        city = dataModelNew.t36[i]['city'];
                        email = dataModelNew.t36[i]['email'];
                      }
                    }
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: itemCountListView,
                itemBuilder: (context, index) {
                  if (widget.section == 't0') {
                    return EmpCard(
                      name: dataModelNew.t0[index]['names'],
                      position: dataModelNew.t0[index]['position'],
                      phone: dataModelNew.t0[index]['phone'],
                      cisco: dataModelNew.t0[index]['cisco'],
                      city: dataModelNew.t0[index]['city'],
                      email: dataModelNew.t0[index]['email'],
                    );
                  } else if (widget.section == 't1') {
                    return EmpCard(
                      name: dataModelNew.t1[index]['names'],
                      position: dataModelNew.t1[index]['position'],
                      phone: dataModelNew.t1[index]['phone'],
                      cisco: dataModelNew.t1[index]['cisco'],
                      city: dataModelNew.t1[index]['city'],
                      email: dataModelNew.t1[index]['email'],
                    );
                  } else if (widget.section == 't2') {
                    return EmpCard(
                      name: dataModelNew.t2[index]['names'],
                      position: dataModelNew.t2[index]['position'],
                      phone: dataModelNew.t2[index]['phone'],
                      cisco: dataModelNew.t2[index]['cisco'],
                      city: dataModelNew.t2[index]['city'],
                      email: dataModelNew.t2[index]['email'],
                    );
                  } else if (widget.section == 't3') {
                    return EmpCard(
                      name: dataModelNew.t3[index]['names'],
                      position: dataModelNew.t3[index]['position'],
                      phone: dataModelNew.t3[index]['phone'],
                      cisco: dataModelNew.t3[index]['cisco'],
                      city: dataModelNew.t3[index]['city'],
                      email: dataModelNew.t3[index]['email'],
                    );
                  } else if (widget.section == 't4') {
                    return EmpCard(
                      name: dataModelNew.t4[index]['names'],
                      position: dataModelNew.t4[index]['position'],
                      phone: dataModelNew.t4[index]['phone'],
                      cisco: dataModelNew.t4[index]['cisco'],
                      city: dataModelNew.t4[index]['city'],
                      email: dataModelNew.t4[index]['email'],
                    );
                  }else if (widget.section == 't6') {
                    return EmpCard(
                      name: dataModelNew.t6[index]['names'],
                      position: dataModelNew.t6[index]['position'],
                      phone: dataModelNew.t6[index]['phone'],
                      cisco: dataModelNew.t6[index]['cisco'],
                      city: dataModelNew.t6[index]['city'],
                      email: dataModelNew.t6[index]['email'],
                    );
                  } else if (widget.section == 't7') {
                    return EmpCard(
                      name: dataModelNew.t7[index]['names'],
                      position: dataModelNew.t7[index]['position'],
                      phone: dataModelNew.t7[index]['phone'],
                      cisco: dataModelNew.t7[index]['cisco'],
                      city: dataModelNew.t7[index]['city'],
                      email: dataModelNew.t7[index]['email'],
                    );
                  } else if (widget.section == 't8') {
                    return EmpCard(
                      name: dataModelNew.t8[index]['names'],
                      position: dataModelNew.t8[index]['position'],
                      phone: dataModelNew.t8[index]['phone'],
                      cisco: dataModelNew.t8[index]['cisco'],
                      city: dataModelNew.t8[index]['city'],
                      email: dataModelNew.t8[index]['email'],
                    );
                  } else if (widget.section == 't9') {
                    return EmpCard(
                      name: dataModelNew.t9[index]['names'],
                      position: dataModelNew.t9[index]['position'],
                      phone: dataModelNew.t9[index]['phone'],
                      cisco: dataModelNew.t9[index]['cisco'],
                      city: dataModelNew.t9[index]['city'],
                      email: dataModelNew.t9[index]['email'],
                    );
                  } else if (widget.section == 't10') {
                    return EmpCard(
                      name: dataModelNew.t10[index]['names'],
                      position: dataModelNew.t10[index]['position'],
                      phone: dataModelNew.t10[index]['phone'],
                      cisco: dataModelNew.t10[index]['cisco'],
                      city: dataModelNew.t10[index]['city'],
                      email: dataModelNew.t10[index]['email'],
                    );
                  } else if (widget.section == 't11') {
                    return EmpCard(
                      name: dataModelNew.t11[index]['names'],
                      position: dataModelNew.t11[index]['position'],
                      phone: dataModelNew.t11[index]['phone'],
                      cisco: dataModelNew.t11[index]['cisco'],
                      city: dataModelNew.t11[index]['city'],
                      email: dataModelNew.t11[index]['email'],
                    );
                  } else if (widget.section == 't12') {
                    return EmpCard(
                      name: dataModelNew.t12[index]['names'],
                      position: dataModelNew.t12[index]['position'],
                      phone: dataModelNew.t12[index]['phone'],
                      cisco: dataModelNew.t12[index]['cisco'],
                      city: dataModelNew.t12[index]['city'],
                      email: dataModelNew.t12[index]['email'],
                    );
                  } else if (widget.section == 't13') {
                    return EmpCard(
                      name: dataModelNew.t13[index]['names'],
                      position: dataModelNew.t13[index]['position'],
                      phone: dataModelNew.t13[index]['phone'],
                      cisco: dataModelNew.t13[index]['cisco'],
                      city: dataModelNew.t13[index]['city'],
                      email: dataModelNew.t13[index]['email'],
                    );
                  } else if (widget.section == 't14') {
                    return EmpCard(
                      name: dataModelNew.t14[index]['names'],
                      position: dataModelNew.t14[index]['position'],
                      phone: dataModelNew.t14[index]['phone'],
                      cisco: dataModelNew.t14[index]['cisco'],
                      city: dataModelNew.t14[index]['city'],
                      email: dataModelNew.t14[index]['email'],
                    );
                  } else if (widget.section == 't15') {
                    return EmpCard(
                      name: dataModelNew.t15[index]['names'],
                      position: dataModelNew.t15[index]['position'],
                      phone: dataModelNew.t15[index]['phone'],
                      cisco: dataModelNew.t15[index]['cisco'],
                      city: dataModelNew.t15[index]['city'],
                      email: dataModelNew.t15[index]['email'],
                    );
                  } else if (widget.section == 't16') {
                    return EmpCard(
                      name: dataModelNew.t16[index]['names'],
                      position: dataModelNew.t16[index]['position'],
                      phone: dataModelNew.t16[index]['phone'],
                      cisco: dataModelNew.t16[index]['cisco'],
                      city: dataModelNew.t16[index]['city'],
                      email: dataModelNew.t16[index]['email'],
                    );
                  } else if (widget.section == 't17') {
                    return EmpCard(
                      name: dataModelNew.t17[index]['names'],
                      position: dataModelNew.t17[index]['position'],
                      phone: dataModelNew.t17[index]['phone'],
                      cisco: dataModelNew.t17[index]['cisco'],
                      city: dataModelNew.t17[index]['city'],
                      email: dataModelNew.t17[index]['email'],
                    );
                  } else if (widget.section == 't18') {
                    return EmpCard(
                      name: dataModelNew.t18[index]['names'],
                      position: dataModelNew.t18[index]['position'],
                      phone: dataModelNew.t18[index]['phone'],
                      cisco: dataModelNew.t18[index]['cisco'],
                      city: dataModelNew.t18[index]['city'],
                      email: dataModelNew.t18[index]['email'],
                    );
                  } else if (widget.section == 't19') {
                    return EmpCard(
                      name: dataModelNew.t19[index]['names'],
                      position: dataModelNew.t19[index]['position'],
                      phone: dataModelNew.t19[index]['phone'],
                      cisco: dataModelNew.t19[index]['cisco'],
                      city: dataModelNew.t19[index]['city'],
                      email: dataModelNew.t19[index]['email'],
                    );
                  } else if (widget.section == 't20') {
                    return EmpCard(
                      name: dataModelNew.t20[index]['names'],
                      position: dataModelNew.t20[index]['position'],
                      phone: dataModelNew.t20[index]['phone'],
                      cisco: dataModelNew.t20[index]['cisco'],
                      city: dataModelNew.t20[index]['city'],
                      email: dataModelNew.t20[index]['email'],
                    );
                  } else if (widget.section == 't21') {
                    return EmpCard(
                      name: dataModelNew.t21[index]['names'],
                      position: dataModelNew.t21[index]['position'],
                      phone: dataModelNew.t21[index]['phone'],
                      cisco: dataModelNew.t21[index]['cisco'],
                      city: dataModelNew.t21[index]['city'],
                      email: dataModelNew.t21[index]['email'],
                    );
                  } else if (widget.section == 't22') {
                    return EmpCard(
                      name: dataModelNew.t22[index]['names'],
                      position: dataModelNew.t22[index]['position'],
                      phone: dataModelNew.t22[index]['phone'],
                      cisco: dataModelNew.t22[index]['cisco'],
                      city: dataModelNew.t22[index]['city'],
                      email: dataModelNew.t22[index]['email'],
                    );
                  } else if (widget.section == 't23') {
                    return EmpCard(
                      name: dataModelNew.t23[index]['names'],
                      position: dataModelNew.t23[index]['position'],
                      phone: dataModelNew.t23[index]['phone'],
                      cisco: dataModelNew.t23[index]['cisco'],
                      city: dataModelNew.t23[index]['city'],
                      email: dataModelNew.t23[index]['email'],
                    );
                  } else if (widget.section == 't24') {
                    return EmpCard(
                      name: dataModelNew.t24[index]['names'],
                      position: dataModelNew.t24[index]['position'],
                      phone: dataModelNew.t24[index]['phone'],
                      cisco: dataModelNew.t24[index]['cisco'],
                      city: dataModelNew.t24[index]['city'],
                      email: dataModelNew.t24[index]['email'],
                    );
                  } else if (widget.section == 't25') {
                    return EmpCard(
                      name: dataModelNew.t25[index]['names'],
                      position: dataModelNew.t25[index]['position'],
                      phone: dataModelNew.t25[index]['phone'],
                      cisco: dataModelNew.t25[index]['cisco'],
                      city: dataModelNew.t25[index]['city'],
                      email: dataModelNew.t25[index]['email'],
                    );
                  } else if (widget.section == 't26') {
                    return EmpCard(
                      name: dataModelNew.t26[index]['names'],
                      position: dataModelNew.t26[index]['position'],
                      phone: dataModelNew.t26[index]['phone'],
                      cisco: dataModelNew.t26[index]['cisco'],
                      city: dataModelNew.t26[index]['city'],
                      email: dataModelNew.t26[index]['email'],
                    );
                  } else if (widget.section == 't27') {
                    return EmpCard(
                      name: dataModelNew.t27[index]['names'],
                      position: dataModelNew.t27[index]['position'],
                      phone: dataModelNew.t27[index]['phone'],
                      cisco: dataModelNew.t27[index]['cisco'],
                      city: dataModelNew.t27[index]['city'],
                      email: dataModelNew.t27[index]['email'],
                    );
                  } else if (widget.section == 't28') {
                    return EmpCard(
                      name: dataModelNew.t28[index]['names'],
                      position: dataModelNew.t28[index]['position'],
                      phone: dataModelNew.t28[index]['phone'],
                      cisco: dataModelNew.t28[index]['cisco'],
                      city: dataModelNew.t28[index]['city'],
                      email: dataModelNew.t28[index]['email'],
                    );
                  } else if (widget.section == 't29') {
                    return EmpCard(
                      name: dataModelNew.t29[index]['names'],
                      position: dataModelNew.t29[index]['position'],
                      phone: dataModelNew.t29[index]['phone'],
                      cisco: dataModelNew.t29[index]['cisco'],
                      city: dataModelNew.t29[index]['city'],
                      email: dataModelNew.t29[index]['email'],
                    );
                  } else if (widget.section == 't30') {
                    return EmpCard(
                      name: dataModelNew.t30[index]['names'],
                      position: dataModelNew.t30[index]['position'],
                      phone: dataModelNew.t30[index]['phone'],
                      cisco: dataModelNew.t30[index]['cisco'],
                      city: dataModelNew.t30[index]['city'],
                      email: dataModelNew.t30[index]['email'],
                    );
                  } else if (widget.section == 't31') {
                    return EmpCard(
                      name: dataModelNew.t31[index]['names'],
                      position: dataModelNew.t31[index]['position'],
                      phone: dataModelNew.t31[index]['phone'],
                      cisco: dataModelNew.t31[index]['cisco'],
                      city: dataModelNew.t31[index]['city'],
                      email: dataModelNew.t31[index]['email'],
                    );
                  } else if (widget.section == 't32') {
                    return EmpCard(
                      name: dataModelNew.t32[index]['names'],
                      position: dataModelNew.t32[index]['position'],
                      phone: dataModelNew.t32[index]['phone'],
                      cisco: dataModelNew.t32[index]['cisco'],
                      city: dataModelNew.t32[index]['city'],
                      email: dataModelNew.t32[index]['email'],
                    );
                  } else if (widget.section == 't33') {
                    return EmpCard(
                      name: dataModelNew.t33[index]['names'],
                      position: dataModelNew.t33[index]['position'],
                      phone: dataModelNew.t33[index]['phone'],
                      cisco: dataModelNew.t33[index]['cisco'],
                      city: dataModelNew.t33[index]['city'],
                      email: dataModelNew.t33[index]['email'],
                    );
                  } else if (widget.section == 't34') {
                    return EmpCard(
                      name: dataModelNew.t34[index]['names'],
                      position: dataModelNew.t34[index]['position'],
                      phone: dataModelNew.t34[index]['phone'],
                      cisco: dataModelNew.t34[index]['cisco'],
                      city: dataModelNew.t34[index]['city'],
                      email: dataModelNew.t34[index]['email'],
                    );
                  } else if (widget.section == 't35') {
                    return EmpCard(
                      name: dataModelNew.t35[index]['names'],
                      position: dataModelNew.t35[index]['position'],
                      phone: dataModelNew.t35[index]['phone'],
                      cisco: dataModelNew.t35[index]['cisco'],
                      city: dataModelNew.t35[index]['city'],
                      email: dataModelNew.t35[index]['email'],
                    );
                  } else if (widget.section == 't36') {
                    return EmpCard(
                      name: dataModelNew.t36[index]['names'],
                      position: dataModelNew.t36[index]['position'],
                      phone: dataModelNew.t36[index]['phone'],
                      cisco: dataModelNew.t36[index]['cisco'],
                      city: dataModelNew.t36[index]['city'],
                      email: dataModelNew.t36[index]['email'],
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

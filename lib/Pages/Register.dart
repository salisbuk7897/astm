import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:astm/Database/dbhelper.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var dbHelper;
  String lg = 'out';
  final carb = TextEditingController();
  final fat = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  //final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final exercise = TextEditingController();
  String imageFile = "No Picture";
  String httptype;
  String ip;
  String port;
  String nn = "jo";
  String _diabeticParent;
  String _smoking;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;
  bool checkedValue4 = false;
  bool checkedValue5 = false;
  bool checkedValue6 = false;
  bool checkedValue7 = false;
  bool checkedValue8 = false;
  bool checkedValue9 = false;
  bool checkedValue10 = false;
  bool checkedValue11 = false;
  bool hypertension = false;
  bool polycystic = false;
  bool gestational = false;
  bool pancreatic = false;
  // Initial Selected Value
  String ethnicity = 'Select one';

  // List of items in our dropdown menu
  var items = [
    'Select one',
    'Latino/Hispanic',
    'African/African American',
    'Native American',
    'Asian/Asian-American',
    'Pacific Islander',
    'Other'
  ];

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    dbHelper.chk();
    //dbHelper.getIDandVersion();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: nn == "" ? Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Please Visit http://148.100.79.164:2020/register on Your Browser to Register",
            textAlign:  TextAlign.center,),
        ),
      ) :SingleChildScrollView(
        child: Card(
          elevation: 5,
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Personal Information"),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: 'Name'
                  ),
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: 'Email'
                  ),
                ),
                TextFormField(
                  controller: age,
                  decoration: InputDecoration(
                      labelText: 'age'
                  ),
                ),
                TextFormField(
                  controller: height,
                  decoration: InputDecoration(
                      labelText: 'height'
                  ),
                ),
                TextFormField(
                  controller: weight,
                  decoration: InputDecoration(
                      labelText: 'weight'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10.0,0,0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("Ethnicity", style: TextStyle(fontSize: 16.0),)
                      ),
                      Expanded(
                        flex:3,
                        child: DropdownButton(
                          isExpanded: true,

                          // Initial Value
                          value: ethnicity,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String newValue) {
                            setState(() {
                              ethnicity = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Text('Diabetic Parent(s)',
                    ),
                  ),
                  subtitle: Text(
                    'Does one or both parents have diabetes',
                    style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text("Yes"),
                        leading: Radio(
                          value: 'True',
                          groupValue: _diabeticParent,
                          onChanged: (String value) {
                            setState(() {
                              _diabeticParent = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("No"),
                        leading: Radio(
                          value: 'False',
                          groupValue: _diabeticParent,
                          onChanged: (String value) {
                            setState(() {
                              _diabeticParent = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Center(
                    child: Text('Smoking',
                    ),
                  ),
                  subtitle: Text(
                    'Do You Smoke?',
                    style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text("Yes"),
                        leading: Radio(
                          value: 'True',
                          groupValue: _smoking,
                          onChanged: (String value) {
                            setState(() {
                              _smoking = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("No"),
                        leading: Radio(
                          value: 'False',
                          groupValue: _smoking,
                          onChanged: (String value) {
                            setState(() {
                              _smoking = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Center(
                    child: Text('Drug(s)',
                    ),
                  ),
                  subtitle: Text(
                    'Please Select all drugs you are taking',
                    style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18),
                  ),
                ),
                CheckboxListTile(
                  title: Text("Chlorpromazine"),
                  value: checkedValue1,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue1 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Clozapine"),
                  value: checkedValue2,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue2 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Olanzapine"),
                  value: checkedValue3,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue3 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Quetiapine"),
                  value: checkedValue4,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue4 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Risperidone"),
                  value: checkedValue5,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue5 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Perphenazine"),
                  value: checkedValue6,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue6 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),CheckboxListTile(
                  title: Text("Haloperidol"),
                  value: checkedValue7,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue7 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Ziprasidone"),
                  value: checkedValue8,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue8 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Aripiprazole"),
                  value: checkedValue9,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue9 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Paliperidone"),
                  value: checkedValue10,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue10 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Lurasidone"),
                  value: checkedValue11,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkedValue11 = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10.0,0,0),
                  child: Text('Diet'),
                ),
                TextFormField(
                  controller: carb,
                  decoration: InputDecoration(
                      labelText: 'Carbohydrate %'
                  ),
                ),
                TextFormField(
                  controller: fat,
                  decoration: InputDecoration(
                      labelText: 'Fat %'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
                  child: Text('Exercise'),
                ),
                TextFormField(
                  controller: exercise,
                  decoration: InputDecoration(
                      labelText: 'Exercise'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
                  child: ListTile(
                    title: Center(
                      child: Text('Medical History',
                      ),
                    ),
                    subtitle: Text(
                      'Please Select all conditions that applies to you',
                      style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18),
                    ),
                  ),
                ), //= 0;
              //pancreatic = 0;
              //polycystic = 0;
              //gestational = 0;
                CheckboxListTile(
                  title: Text("Hypertension"),
                  value: hypertension,
                  onChanged: (bool newValue) {
                    setState(() {
                      hypertension = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Pancreatic Disease"),
                  value: pancreatic,
                  onChanged: (bool newValue) {
                    setState(() {
                      pancreatic = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("PCOS"),
                  value: polycystic,
                  onChanged: (bool newValue) {
                    setState(() {
                      polycystic = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("GDM"),
                  value: gestational,
                  onChanged: (bool newValue) {
                    setState(() {
                      gestational = newValue;
                      //print(checkedValue1);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
                  child: Text('Account Details'),
                ),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      labelText: 'Username'
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: cpassword,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password'
                  ),
                ),
                SizedBox(height: 10.0,),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {
                      List drugs = [];
                      int hp,pc,gdm,pcos;
                      if(hypertension != false){
                        hp = 1;
                      }else{
                        hp = 0;
                      }
                      if(pancreatic != false){
                        pc = 1;
                      }else{
                        pc = 0;
                      }
                      if(gestational != false){
                        gdm = 1;
                      }else{
                        gdm = 0;
                      }
                      if(polycystic != false){
                        pcos = 1;
                      }else{
                        pcos = 0;
                      }
                      if(checkedValue1 != false){
                        drugs.add('Chlorpromazine');
                      }
                      if(checkedValue2 != false){
                        drugs.add('Clozapine');
                      }
                      if(checkedValue3 != false){
                        drugs.add('Olanzapine');
                      }
                      if(checkedValue4 != false){
                        drugs.add('Quetiapine');
                      }
                      if(checkedValue5 != false){
                        drugs.add('Risperidone');
                      }
                      if(checkedValue6 != false){
                        drugs.add('Perphenazine');
                      }
                      if(checkedValue7 != false){
                        drugs.add('Haloperidol');
                      }
                      if(checkedValue8 != false){
                        drugs.add('Ziprasidone');
                      }
                      if(checkedValue9 != false){
                        drugs.add('Aripiprazole');
                      }
                      if(checkedValue10 != false){
                        drugs.add('Paliperidone');
                      }
                      if(checkedValue11 != false){
                        drugs.add('Lurasidone');
                      }
                      //print(drugs);
                      Map body = {
                        "name": name.text,
                        "email" : email.text,
                        "age" : int.parse(age.text),
                        "height" : int.parse(height.text),
                        "weight" : int.parse(weight.text),
                        "ethnicity" : ethnicity,
                        "diabeticParent" : _diabeticParent,
                        "smoking" : _smoking,
                        "drug" : drugs,
                        "carb" : int.parse(carb.text),
                        "fat" : int.parse(fat.text),
                        "exercise" : int.parse(exercise.text),
                        "hp" : hp,
                        "pc" : pc,
                        "gdm" : gdm,
                        "pcos" : pcos,
                        "username" : username.text,
                        "pwd" : password.text,
                        "cpwd" : password.text,
                      };
                      dbHelper.saveUser(body);
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text("Register", style: TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
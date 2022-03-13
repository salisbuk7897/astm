import 'dart:math';

import 'package:astm/Database/dbhelper.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List user;
  double bmis = 0.0;
  String bmiInterpretation;
  double riskScore;
  String riskInterpretation;

  @override
  void initState() {
    super.initState();

  }

  Future<double> getScore(user, bmi) async {
    int age = user[0]['age'];
    String sex = 'M';
    String ethnicity =user[0]['ethnicity'];
    int weight = user[0]['weight']; // kg
    int height = user[0]['height']; // cm
    int smoker = user[0]['smoking'];
    int activity = user[0]['exercise'];
    int daily_carbs = user[0]['carb']; //number of carbs portions ingested per day
    int daily_fats = user[0]['fat']; //number of fat portions ingested per day
    int parent = user[0]['diabeticParent'];
    int hypertension = user[0]['hypertension'];
    int pancreatic = user[0]['pancreatic'];
    int polycystic = user[0]['polycystic'];
    int gestational = user[0]['gestational'];
    String drug = user[0]['gestational'];
    double drugs_weight = 0.0;
    double risk = 0.0;


    if (ethnicity  == 'Native American'){
      risk = risk+5;
    }else if(ethnicity == 'Black') {
      risk = risk + 5;
    }else if(ethnicity == 'Hispanic') {
      risk = risk + 3;
    }else if (ethnicity == 'Asian'){
      risk = risk + 3;
    }

    risk = risk + 50/20*(bmi-20);

    if (smoker == 1){
      risk = risk + 20;
    }

    risk = risk + (4-activity)*20/4;

    if(parent == 1){
      risk = risk + 20;
    }

    if (hypertension == 1) {
      risk = risk + 20;
    }

    if(polycystic == 1){
    risk = risk + 10;
    }

    if(gestational == 1){
      risk = risk + 20;
    }

    if(pancreatic == 1){
      risk = risk + 10;
    }

    int diet = daily_carbs + daily_fats;
    risk=risk+(diet-3)*5;

    if(age >= 45){
      risk = risk*(0.3/45*(age-35)+1);
    }

    if(sex == 'M'){
      risk = risk*1.1;
    }

    return risk;
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
  getUser() async {
    await DBHelper().getUser().then((List SC){
      //print('Preps $preps');
      if(this.mounted){
        setState(() {
          user = SC;
          int userheight = user[0]['height'];
          int userweight = user[0]['weight'];
          double bmi = userweight/(pow((userheight/100),2));
          bmis = roundDouble(bmi, 2);
          if(bmis <= 18.4){
            bmiInterpretation = "UnderWeight";
          }else if(bmis >= 18.5 && bmis <= 24.9){
            bmiInterpretation = "Healthy Weight";
          }else if(bmis >= 25.0 && bmis <= 29.9){
            bmiInterpretation = "Overweight";
          }else if(bmis >= 30.0){
            bmiInterpretation = "Obesity";
          }

          int age = user[0]['age'];
          String sex = 'M';
          String ethnicity =user[0]['ethnicity'];
          int weight = user[0]['weight']; // kg
          int height = user[0]['height']; // cm
          int smoker = user[0]['smoking'];
          int activity = user[0]['exercise'];
          int daily_carbs = user[0]['carb']; //number of carbs portions ingested per day
          int daily_fats = user[0]['fat']; //number of fat portions ingested per day
          int parent = user[0]['diabeticParent'];
          int hypertension = user[0]['hypertension'];
          int pancreatic = user[0]['pancreatic'];
          int polycystic = user[0]['polycystic'];
          int gestational = user[0]['gestational'];
          //String drug = user[0]['gestational'];
          double drugs_weight = 0.0;
          double risk = 0.0;


          if (ethnicity  == 'Native American'){
            risk = risk+5;
          }else if(ethnicity == 'Black') {
            risk = risk + 5;
          }else if(ethnicity == 'Hispanic') {
            risk = risk + 3;
          }else if (ethnicity == 'Asian'){
            risk = risk + 3;
          }

          risk = risk + 50/20*(bmi-20);

          if (smoker == 1){
            risk = risk + 20;
          }

          risk = risk + (4-activity)*20/4;

          if(parent == 1){
            risk = risk + 20;
          }

          if (hypertension == 1) {
            risk = risk + 20;
          }

          if(polycystic == 1){
            risk = risk + 10;
          }

          if(gestational == 1){
            risk = risk + 20;
          }

          if(pancreatic == 1){
            risk = risk + 10;
          }

          int diet = daily_carbs + daily_fats;
          risk=risk+(diet-3)*5;

          if(age >= 45){
            risk = risk*(0.3/45*(age-35)+1);
          }

          if(sex == 'M'){
            risk = risk*1.1;
          }

          riskScore = roundDouble((risk), 2);

          if(riskScore <= 45){
            riskInterpretation = "Low/No risk";
          }else if(riskScore >= 46 && riskScore <= 70){
            riskInterpretation = "Moderate Risk";
          }else if(riskScore >= 71 && riskScore <= 130){
            riskInterpretation = "High Risk";
          }else if(riskScore >= 130){
            riskInterpretation = "Very High Risk";
          }
        });
      }
    });
  }

  /*calBMI(user) async {
    int height = user[0]['height'];
    int weight = user[0]['weight'];
    print(height);
    print(weight);
    double bmi = weight/(pow((height/100),2));
    print(bmi);
    if(this.mounted){
      setState(() {
        bmi = bmi;
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    getUser();
    //calBMI(user);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,40.0, 20.0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10.0,0,10.0),
              child: Center(child: Text('Personal Information', style: TextStyle(fontSize: 18.0),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                      child: Text("Name:", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                    flex: 3,
                      child: Text("${user[0]["name"]}", style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Age:", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text("${user[0]["age"]}", style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Email:", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text("${user[0]["email"]}", style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Ethnicity:", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text("${user[0]["ethnicity"]}", style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,30.0,0,10.0),
              child: Center(child: Text('Health Profile', style: TextStyle(fontSize: 18.0),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("BMI:", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text('${bmis.toString()}', style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("BMI Interpretation:", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text("$bmiInterpretation", style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("Diabetes Risk Score", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text("${riskScore.toString()}", style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("Risk Interpretation:", style: TextStyle(fontSize: 16.0),)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text("$riskInterpretation", style: TextStyle(fontSize: 16.0),)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

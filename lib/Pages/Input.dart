import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
              "You have a test scheduled today. Please input the glucose level indicated by your glucometer "
              , style: TextStyle(
              fontSize: 26.0
          )
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter Blood Glucose Level Today'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () async {},
                      color: Colors.lightGreen,
                      child: Text("SAVE", style: TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  Icon(Icons.data_usage),
                  Text('Input Data'),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        print("clicked");
                        Navigator.pushReplacementNamed(context, '/chart');
                      },
                      child: Icon(Icons.bar_chart)
                  ),
                  Text('Trend'),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        print("clicked");
                        Navigator.pushReplacementNamed(context, '/chart');
                      },
                      child: Icon(Icons.pages)
                  ),
                  Text('Recommendation'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.person),
                  Text('Profile'),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}

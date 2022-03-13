import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "You do not have a test scheduled today. Your next test is on 15/3/2022. If you desire, "
                  "you can still record your blood glucose level.", style: TextStyle(
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
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          Navigator.pushNamed(context, '/input');
                        },
                        child: Icon(Icons.data_usage)
                    ),
                    Text('Input Data'),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          print("clicked");
                          Navigator.pushNamed(context, '/chart');
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
                          Navigator.pushNamed(context, '/chart');
                        },
                        child: Icon(Icons.pages)
                    ),
                    Text('Recommendation'),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Icon(Icons.person)
                    ),
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

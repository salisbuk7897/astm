import 'package:astm/Database/dbhelper.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final pass = TextEditingController();
  List userlist;

  @override
  void initState() {
    super.initState();
    //dbHelper.getIDandVersion();
  }

  getUser() async {
    await DBHelper().getUser().then((List SC) {
      //print('Preps $preps');
      if (this.mounted) {
        setState(() {
          userlist = SC;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("LOGIN"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: user,
              decoration: InputDecoration(
                  labelText: 'Username'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: () async {
                if(userlist.length>= 1){
                  if(user.text == userlist[0]['username'] && pass.text == userlist[0]['password'] ){
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                }else{
                  print("No User");
                }
              },
              child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/register');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
              child: Text('Dont have an Account? Click here to register'),
            ),
          )
        ],
      ),
    );
  }
}

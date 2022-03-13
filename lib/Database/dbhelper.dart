import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user_entity.dart';
//import 'Courses_Entity.dart';
//import 'tests_entity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class DBHelper {
  static Database _db;
  static const String TABLE = 'User';
  static const String DB_NAME = 'astm10.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  chk() async{
    var check = await db;
    print('db');
    print(check);
    DBrecord();
  }

  saveUser( Map user) async{
    int diabeticParent;
    int smoking;
    //print('in db');
    //print(user);
    if(user['diabeticParent'].toString() == 'False'){
      diabeticParent = 0;
    }else{
      diabeticParent = 1;
    }

    if(user['smoking'].toString() == 'False'){
      smoking = 0;
    }else{
      smoking = 1;
    }
    String drug = '';
    for (var i in user['drug']){
      drug = drug + i + ";";
    }
    print(drug);
    int age = int.parse(user['age'].toString());
    int height = int.parse(user['height'].toString());
    int  weight = int.parse(user['weight'].toString());
    int carb = int.parse(user['carb'].toString());
    int fat = int.parse(user['fat'].toString());
    int exercise = int.parse(user['exercise'].toString());
    print(age);
    var dbClient = await db;
    List list = await dbClient.rawQuery('SELECT * FROM $TABLE');
    if(list.length >= 1){
      print("User Already Exist");
    }else{
      await dbClient.transaction((txn) async {
        int id2 = await txn.rawInsert(
            'INSERT INTO $TABLE (name, email, age, height, weight, ethnicity, diabeticParent, smoking, drugs, carb, fat, exercise, hypertension, pancreatic, polycystic, gestational, username, password) values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?, ?,?,?,?,?,?)', [user['name'], user['email'], age, height, weight, user['ethnicity'], diabeticParent, smoking, drug, carb, fat, exercise, user['hp'], user['pc'], user['pcos'], user['gdm'],user['username'], user['pwd']]);
        print('inserted: $id2');
      });
    }
    /*await dbClient
        .execute( "INSERT INTO $TABLE (name, email, age, height, weight, ethnicity, diabeticParent, smoking, drugs, carb, fat, username, password) values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,?)", [user['name'], user['email'], age, height, weight, user['ethnicity'], diabeticParent, smoking, user['drug'], carb, fat, user['username'], user['pwd']]);
     */
    DBrecord();
  }

  DBrecord() async {
    var dbClient = await db;
    List list = await dbClient.rawQuery('SELECT * FROM $TABLE');
    print(list);
  }

  Future<List> getUser() async{
    List pq = [];
    var dbClient = await db;
    List list = await dbClient.rawQuery('SELECT * FROM $TABLE');
    pq = list.toList();
    return pq;
  }

  initDb() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute( //this.id, this.name, this.email, this.age, this.height, this.weight, this., this.diabeticParent, this.smoking, this.drugs, this.carb, this.fat, this.username, this.password
        "CREATE TABLE $TABLE (id INTEGER PRIMARY KEY, name TEXT, email TEXT, age INTEGER, height INTEGER, weight INTEGER, ethnicity TEXT, diabeticParent INTEGER, smoking INTEGER, drugs TEXT, carb INTEGER, fat INTEGER, exercise INTEGER, hypertension INTEGER, pancreatic INTEGER, polycystic INTEGER, gestational INTEGER, username TEXT, password TEXT)");
    //print("db created");
  }
}
class User {
  int id;
  String name;
  String email;
  int age;
  int height;
  int weight;
  String ethnicity;
  bool diabeticParent;
  bool smoking;
  List drugs;
  String carb;
  String fat;
  int exercise;
  String username;
  String password;
  int hypertension;
  int pancreatic;
  int polycystic;
  int gestational;
  User(this.id, this.name, this.email, this.age, this.height, this.weight, this.ethnicity, this.diabeticParent, this.smoking, this.drugs, this.carb, this.fat, this.exercise, this.hypertension, this.pancreatic, this.polycystic, this.gestational, this.username, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'height' : height,
      'weight' : weight,
      'ethnicity' : ethnicity,
      'diabeticParent': diabeticParent,
      'smoking' : smoking,
      'drugs' : drugs,
      'carb' : carb,
      'fat' : fat,
      'exercise' : exercise,
      'hypertension': hypertension,
      'pancreatic' : pancreatic,
      'polycystic' : polycystic,
      'gestational' : gestational,
      'username': username,
      'password': password

    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    age = map['age'];
    height = map['height'];
    weight = map['weight'];
    ethnicity = map['ethnicity'];
    diabeticParent = map['diabeticParent'];
    smoking  = map['smoking'];
    drugs = map['drugs'];
    carb = map['carb'];
    fat = map['fat'];
    exercise = map["exercise"];
    hypertension = map["hypertension"];
    pancreatic = map['pancreatic'];
    polycystic = map['polycystic'];
    gestational = map['gestational'];
    username = map['username'];
    password = map['password'];
  }
}
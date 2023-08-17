class User {
  String? name;
  String? age;
  String? location;
  User();

//عشان احول الاوبجكت ل ملف جيسون
Map<String,dynamic> toJson() =>{
   'name': name,
        'age': age,
        'location': location,
};
//تعكس
  User.fromjson(Map<String, dynamic> data) {
    name = data['name'];
    age = data['age'];
    location = data['location'];
  }
}

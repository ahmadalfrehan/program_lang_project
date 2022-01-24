class RegisterModel
{

  late String token;
  late UserData data;

  RegisterModel.fromJson(Map<String, dynamic> json)
  {
    token = json['token'];
    data =UserData.fromJson(json['data']);
  }
}

class UserData
{
  // late  int id;
  late  String name;
  late  String email;
  late  String pass;
  late  String number;
  late  String facebook;

  UserData.fromJson(Map<String, dynamic> json)
  {
    // id = json['id'];
    name = json['name'];
    email = json['email'];
    number = json['number'];
    pass = json['pass'];
    facebook = json['facebook'];
  }
}
class LoginModel
{
  late String message;
  late String token;
 late UserData data;

  LoginModel.fromJson(Map<String, dynamic> json)
  {
    token = json['token'];
    message = json['message'];
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
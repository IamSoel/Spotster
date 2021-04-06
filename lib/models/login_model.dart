class LoginModel {
  final String _email;
  final String _password;

  LoginModel(this._email, this._password);

  LoginModel.fromJson(Map<String, dynamic> parsedJson)
      : _email = parsedJson['email'],
        _password = parsedJson['password'];
   
        
}

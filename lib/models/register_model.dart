class RegisterModel {
  final String _firstName;
  final String _lastName;
  final String _password;
  final String _email;
  final String _contact;
  final String _gender;
  final String _birthDate;

  RegisterModel(this._firstName, this._lastName, this._password, this._email,
      this._contact, this._birthDate, this._gender);

 RegisterModel.fromJson(Map<String, dynamic> parsedJson)
      : _firstName = parsedJson['firstName'],
        _lastName = parsedJson['lastName'],
        _password = parsedJson['password'],
        _email = parsedJson['email'],
        _gender = parsedJson['gender'],
        _contact = parsedJson['contact'],
        _birthDate = parsedJson['birthdate'];

  RegisterModel.fromDb(Map<String, dynamic> parsedJson)
      : _firstName = parsedJson['firstName'],
        _lastName = parsedJson['lastName'],
        _password = parsedJson['password'],
        _email = parsedJson['email'],
        _gender = parsedJson['gender'],
        _contact = parsedJson['contact'],
        _birthDate = parsedJson['birthdate'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': _firstName,
      'lastName': _lastName,
      'password': _password,
      'email': _email,
      'gender': _gender,
      'contact': _contact,
      'birthDate': _birthDate,
    };
  }
}

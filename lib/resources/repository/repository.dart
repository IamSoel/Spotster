import 'package:sportster/models/register_model.dart';

class Repository {


  
}

abstract class Source {
  Future<RegisterModel> fetchUserData();
  Future<int> addUserData(RegisterModel registerModel);
}

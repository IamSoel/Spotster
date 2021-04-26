import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportster/models/login_model.dart';

class SharedPref {
  SharedPreferences sharedPreferences;

  void sharedLoginSave(LoginModel loginModel) async {
    sharedPreferences = await SharedPreferences.getInstance();
    //sharedPreferences.setInt('id', loginModel.id);
    sharedPreferences.setString('email', loginModel.email);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceHelper{
  static String userIdkey="USERKEY";
  static String userNamekey="USERNAMEKEY";
  static String userEmailkey="USEREMAILKEY";
  static String userImagekey="USERIMAGEKEY";

  Future<bool> saveUserId(String getUserId)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdkey, getUserId);
  }
  Future<bool> saveUserName(String getUserName)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString( userNamekey, getUserName);
  }
  Future<bool> saveUserEmail(String getUserEmail)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdkey, getUserEmail);
  }
  Future<bool> saveUserImage(String getUserImage)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdkey, getUserImage);
  }

  Future<String?>getUserId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdkey);
  }
  Future<String?>getUserNmae()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNamekey);
  }
  Future<String?>getUserEmail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailkey);
  }
  Future<String?>getUserImage()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userImagekey);
  }
}
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/data/models/sign_in_model.dart';

class AuthController {
  final String _accessTokenKey = "access-token";
  final String _profileDataKey = "access-token";

  String? accessToken;
  User? profileModel;

  Future<void> saveUserData(String accessToken, User userModel) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, accessToken);
    await sharedPreferences.setString(_profileDataKey, jsonEncode(userModel.toJson()));
    profileModel = userModel;
  }

  Future<void> getUserData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    profileModel = User.fromJson(jsonDecode(sharedPreferences.getString(_profileDataKey)!));
  }

  Future<void>saveToken(String token)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('accessToken', token);
  }

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('accessToken');
  }

  Future<bool> isUserLoggedIn()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if(token != null){
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearUserData()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
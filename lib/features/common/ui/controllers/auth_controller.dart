import 'dart:convert';

import 'package:craftybay/features/auth/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _accessTokenKey = "access-token";
  final String _profileDataKey = "access-token";

  String? accessToken;
  ProfileModel? profileModel;

  Future<void> saveUserData(String accessToken, ProfileModel model) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, accessToken);
    await sharedPreferences.setString(_profileDataKey, jsonEncode(model.toJson()));
  }

  Future<String?> getUserData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    profileModel = ProfileModel.fromJson(jsonDecode(sharedPreferences.getString(_profileDataKey)!));
    return accessToken;
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
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class sharedPref{
  save (String key,value)async{
   final SharedPreferences pref=await SharedPreferences.getInstance();
  return await pref.setString(key, jsonEncode(value) );
  }
 load(String key)async{
  final pref=await SharedPreferences.getInstance();
  if(pref.containsKey(key)){
  return jsonDecode(pref.getString(key)! );
  }
   else {
    return 'user not found';
  }
 }
 clear(String key)async{
  final SharedPreferences pref=await SharedPreferences.getInstance();
  pref.remove(key);
 }



}
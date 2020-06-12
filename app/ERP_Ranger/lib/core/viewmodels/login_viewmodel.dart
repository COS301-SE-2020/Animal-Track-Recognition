import 'package:ERP_Ranger/core/services/api.dart';
import 'package:ERP_Ranger/core/viewmodels/base_model.dart';
import 'package:ERP_Ranger/locator.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'base_model.dart';

class LoginModel extends BaseModel{
  final Api _api = locator<Api>();
  
  // Future validateUser(String url, Map map){
  //   return _api.login(url, map);
  // }

}
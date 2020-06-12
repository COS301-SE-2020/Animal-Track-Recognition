import 'package:ERP_Ranger/core/services/api.dart';
import 'package:ERP_Ranger/core/services/user.dart';
import 'package:ERP_Ranger/locator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'base_model.dart';


class HomeModel extends BaseModel{
  final Api _api = locator<Api>();

  Future<bool> imagePicker() async{
    File image;
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.camera);
    image = File(pickedFile.path);
    //String url = base64Encode(image.readAsBytesSync());
    //Map map = {};
    //_api.updateImage(url, map);
    //print(image);
    return true;
  }

  
  Future navigateTo() async{
  }


  Future<List<User>> getResults() async {
      return _api.getResults();
  }

  void updateCounter(){
    notifyListeners();
  }


}


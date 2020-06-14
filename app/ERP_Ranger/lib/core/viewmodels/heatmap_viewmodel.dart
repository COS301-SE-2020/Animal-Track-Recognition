import 'package:ERP_Ranger/locator.dart';
import 'package:flutter/material.dart';
import 'package:ERP_Ranger/core/services/api.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'base_model.dart';

class HeatMapModel extends BaseModel{
final Api _api = locator<Api>();
 Future<String> imagePicker() async{
    File image;
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null){
      image = File(pickedFile.path);
      String url = base64Encode(image.readAsBytesSync());
      
      return url;
    }else{
      return "";
    }

  }

}
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../../../core/viewmodels/confirm_viewmodel.dart';
import '../../widgets/bottom_nav.dart';
import '../base_view.dart';
import 'dart:io';


class ConfirmView extends StatefulWidget {
  ConfirmView({Key key}) : super(key: key);

  @override
  _ConfirmView createState() => _ConfirmView();
}

class _ConfirmView extends State<ConfirmView> {
  @override
  Widget build(BuildContext context) {

    return BaseView<ConfirmModel>(
        builder: (context, model, child) => Scaffold(
          body: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: ListView(
                      children: <Widget>[
                          ViewButton(model: model),
                          DownLoadButton(model: model),
                          RecaptureButton(model: model)
                      ]
                  )
              ),
          ),
        ),
    );
  }
}

class ViewButton extends StatelessWidget {
  var model;

  ViewButton({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 325,
        margin: const EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: RaisedButton(
          textColor: Colors.white,
          child: Text(
            'View Spoor',
            style: TextStyle(fontSize: 15,
            fontFamily: 'Arciform'),
          ),
          onPressed: () async{
          
              
          },
        ),
        
    );
  }
}

class DownLoadButton extends StatelessWidget {
  var model;

  DownLoadButton({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 325,
        margin: const EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: RaisedButton(
          textColor: Colors.white,
          child: Text(
            'Download Image',
            style: TextStyle(fontSize: 15,
            fontFamily: 'Arciform'),
          ),
          onPressed: () async{
          
              
          },
        ),
        
    );
  }
}

class RecaptureButton extends StatelessWidget {
  var model;

  RecaptureButton({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 325,
        margin: const EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: RaisedButton(
          textColor: Colors.white,
          child: Text(
            'Recapture Image',
            style: TextStyle(fontSize: 15,
            fontFamily: 'Arciform'),
          ),
          onPressed: () async{

          },
        ),
        
    );
  }
}
import 'package:ERP_Ranger/router.dart';
import 'package:ERP_Ranger/ui/views/home/home_view.dart';
import 'package:ERP_Ranger/ui/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:ERP_Ranger/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

 void main() {
  // setup locator
  setupLocator();
  runApp(ERP());
}

class ERP extends StatefulWidget {

  @override
  _ERP createState() => _ERP();
}

class _ERP extends State<ERP> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: getLoggedIn(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
          }
          if(snapshot.data == true){
            return MaterialApp(
              title: 'Flutter Demo',
              home: HomeView(),
              routes: <String, WidgetBuilder>{
                  '/home' : (context)  => HomeView(),
              },
              onGenerateRoute: Router.generateRoute,
            );
          }else {
            return MaterialApp(
              title: 'Flutter Demo',
              home: LoginView(),
              routes: <String, WidgetBuilder>{
                  '/home' : (context)  => HomeView(),
              },
              onGenerateRoute: Router.generateRoute,
            );
          }
        },
    );
  }
}
Future<bool> getLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool loggedIn = prefs.getBool('loggedIn') ?? false;
  //await prefs.setInt('tabIndex', 0);
  print(loggedIn);
  return loggedIn;
}
import 'dart:async';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';

class Api{
    
    Future<bool> login() async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //var body = jsonEncode(map);

        // final http.Response response = await http.post(
        //     url,
        //     headers: {'Content-Type': 'application/json'},
        //     body: body
        // );

        if(true){
            prefs.setBool("loggedIn", true);
            return true;
        }else{
            return false;
        }

    }

    List<User> getResults() {
        //SharedPreferences prefs = await SharedPreferences.getInstance();
        //var body = jsonEncode(map);

        // final http.Response response = await http.post(
        //     url,
        //     headers: {'Content-Type': 'application/json'},
        //     body: body
        // );

        // var jsonData = json.decode(response.body);

        List<User> animals = [];

        User rhino = User(0, "Rhino", "About", "Email","dummy");
        animals.add(rhino);
        User buffalo = User(1, "Buffalo", "About", "Email","dummy");
        animals.add(buffalo);
        User elephant = User(2, "Elephant", "About", "Email","dummy");
        animals.add(elephant);        
        User lion = User(3, "Lion", "About", "Email","dummy");
        animals.add(lion);
        User leopard = User(4, "Leopard", "About", "Email","dummy");
        animals.add(leopard);      
        User tiger = User(5, "Tiger", "About", "Email","dummy");
        animals.add(tiger); 
        User puma = User(7, "Puma", "About", "Email","dummy");
        animals.add(puma);  
        if(true){
            return animals;
        }else{
            return animals;
        }
    }

    Future<bool> updateImage(String url,Map map) async{
        //SharedPreferences prefs = await SharedPreferences.getInstance();
        //var body = jsonEncode(map);

        // final http.Response response = await http.post(
        //     url,
        //     headers: {'Content-Type': 'application/json'},
        //     body: body
        // );

        if(true){
            //prefs.setBool("loggedIn", true);
            return true;
        }else{
            return false;
        }

    }
}
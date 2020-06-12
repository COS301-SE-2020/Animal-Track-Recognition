import 'package:ERP_Ranger/core/services/api.dart';
import 'package:ERP_Ranger/ui/views/confirm/confirm_view.dart';
import 'package:ERP_Ranger/ui/views/home/animal_infoview.dart';
import '../../../core/viewmodels/home_viewmodel.dart';
import '../../../core/services/user.dart';
import 'package:flutter/material.dart';
import '../../../locator.dart';
import '../../widgets/bottom_nav.dart';
import '../base_view.dart';
//import 'package:provider_assist/provider_assist.dart';

List<User> holder = List<User>();
class HomeView extends StatefulWidget {

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int _currentTabIndex = 0;
  var quer;
  List<User> users = List();
  final Api _api = locator<Api>();
  TextEditingController editingController = TextEditingController();

  @override
  void dispose(){
    editingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    setState(() {
      users = _api.getResults();
      holder.addAll(users);
    });

  }

  void filterSearch(String query){
    List<User> dummySearchList = List<User>();
    dummySearchList.addAll(users);
    if(query.isNotEmpty){
      List<User> dummyListData = List<User>();
      users.clear();
      users.addAll(holder);
      dummySearchList.forEach((element) {
        if(element.name.toLowerCase().contains(query.toLowerCase()) || element.about.contains(query) ){
          dummyListData.add(element);
        }
      });
      setState(() {
        holder.clear();
        holder.addAll(dummyListData);
      });
      return;
    }else{
      setState(() {
        holder.clear();
        holder.addAll(users);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigation bottomNavigation = new BottomNavigation();
    bottomNavigation.setIndex(_currentTabIndex);


    return BaseView<HomeModel>(
        builder: (context, model, child) => Scaffold(
            body: Column(
                children: <Widget>[
                      Expanded(
                        flex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  margin: new EdgeInsets.only(top:20),
                                  height: 20,
                                  child: Text("Recent Identifications",
                                  style: TextStyle(fontSize: 25,
                                  fontFamily: 'Arciform')
                                  )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  onChanged: (value){
                                    filterSearch(value);
                                  },
                                  controller: editingController,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))
                                  ),

                                ),
                              ),              
                            ],
                          ),
                        ),
                      Expanded(
                          child: ListView.builder(
                            itemCount: holder.length,
                            itemBuilder: (BuildContext context, int index){
                              return Card(
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ListTile(
                                        
                                        leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1503066211613-c17ebc9daef0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
                                          ),
                                        ),
                                        title:Text(holder[index].name),
                                        subtitle: Text('Date: 09/09/2020',
                                            style: TextStyle(fontSize: 15,
                                            fontFamily: 'Arciform'),
                                        ),
                                        trailing: Text("35%",
                                            style: TextStyle(fontSize: 20,
                                            fontFamily: 'Arciform')
                                        ),
                                        onTap: (){
                                          Navigator.push(context, 
                                            new MaterialPageRoute(builder: (context) => AnimalView())
                                          );
                                        },
                                      ),
                                      SizedBox(height: 0.0,)
                                    ],
                                  ),
                                )
                              );
                            }
                          ),
                      )
                ],
            ),
            bottomNavigationBar: BottomNavigation(),
            floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_a_photo),
            backgroundColor: Color(0xFFF2929C),
            tooltip: 'Pick Image',
            onPressed:()async{
                bool boolean = await model.imagePicker();
                // Navigator.push(context, 
                //     new MaterialPageRoute(builder: (context) => ConfirmView(boolean))
                // );   
            } 
          ),
        )
    );
  }

   
}


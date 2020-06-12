import 'package:ERP_Ranger/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import '../../../core/viewmodels/info_viewmodel.dart';
import '../../widgets/bottom_nav.dart';
import '../base_view.dart';
import '../../../locator.dart';
import '../../../core/services/user.dart';
import 'package:ERP_Ranger/core/services/api.dart';
import 'dart:io';
List<User> searchUser = List();
class InfoView extends StatefulWidget {
  InfoView({Key key}) : super(key: key);

  @override
  _InfoView createState() => _InfoView();
}

class _InfoView extends State<InfoView> {
  int _currentTabIndex = 1;

  List<User> users = List();
  final Api _api = locator<Api>();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    setState(() {
      users = _api.getResults();
    });

  }




  @override
  Widget build(BuildContext context) {
    BottomNavigation bottomNavigation = new BottomNavigation();
    bottomNavigation.setIndex(_currentTabIndex);

    Future<bool> _onBackPressed() async{
       Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
    }

Widget _build(model,name){
              return new WillPopScope(
                onWillPop: _onBackPressed,
                child: Scaffold(
                  body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount:2,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Color(0xFFF2929C),
                          elevation:10,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                ListTile(
                                  leading: Container(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1503066211613-c17ebc9daef0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
                                          ),
                                      ),
                                    ),
                                    title: Text(name),
                                    subtitle: Text('About $name'),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                ListTile(
                                    title: Text('Description'),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                ListTile(
                                    title: Text('Behavioural Information'),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                ListTile(
                                    title: Text('Habits'),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                FlatButton(
                                    child: Center(
                                        child: Text(
                                      'View More',
                                        style: TextStyle(fontSize: 15,
                                        fontFamily: 'Arciform'),
                                      )
                                    ),
                                    onPressed: (){},
                                    color: Colors.black12,
                                    highlightColor: Colors.grey,
                                    padding: EdgeInsets.all(8.0),
                                 ), 
                              
                              ],
                            ),
                          )
                          );
                        },
                      ) 
                    ),
                  ],
                )
            ),
          );
    }

    return BaseView<InfoModel>(
        builder: (context, model, child) => DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFF2929C),
              title: Text("Search App",
                  style: TextStyle(fontSize: 20,
                  fontFamily: 'Arciform')
              ),
              actions: <Widget>[
                  IconButton(icon: Icon(Icons.search), onPressed: (){
                      showSearch(context: context, delegate: DataSearch(users));
                      })
                  ],
                  bottom: TabBar(
                      indicatorColor: Colors.white,
                      tabs: <Widget>[
                          Tab(child: Text('Elephant',
                              style: TextStyle(fontSize: 15,
                              fontFamily: 'Arciform'),
                              ),
                            ),
                          Tab(child: Text('Buffalo',
                              style: TextStyle(fontSize: 15,
                              fontFamily: 'Arciform'),
                              ),
                            ),
                          Tab(child: Text('Rhinocereous',
                              style: TextStyle(fontSize: 15,
                              fontFamily: 'Arciform'),
                              ),
                            ),
                      ],
                  ),
                ),
                body: TabBarView(
                  children: [
                      _build(model,'Elephant'),
                      _build(model,'Buffalo'),
                      _build(model,'Rhinocereous'),
                  ]
                ),
                bottomNavigationBar: BottomNavigation(),
                floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add_a_photo),
                backgroundColor: Color(0xFFF2929C),
                tooltip: 'Pick Image',
                onPressed:()async{
                    bool boolean = await model.imagePicker();   
                } 
              ),
            )
        ) 
    );
  }
}


 class DataSearch extends SearchDelegate<String>{
     
      List<User> recentAnimals;

      DataSearch(this.recentAnimals);
      @override
      List<Widget> buildActions(BuildContext context) {
        // TODO: implement buildActions
        // Actions For App Bar
        return [
            IconButton(icon: Icon(Icons.clear), onPressed: (){
                query = "";
            })
        ];
      }

      @override
      Widget buildLeading(BuildContext context) {
        // TODO: implement buildLeading
        // leading icon for the left of the app bar
        return IconButton(icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation,
        ), onPressed: (){
            close(context,null);
        });
      }

      @override
      Widget buildResults(BuildContext context) {
        // TODO: implement buildResults
        // show results based on the selection
        return null;
      }

      @override
      Widget buildSuggestions(BuildContext context) {
        // TODO: implement buildSuggestions
        // show when someone searches for something
        final suggestionList = query.isEmpty
            ? searchUser
            : recentAnimals.where((u) => 
                            ( u.name.toLowerCase().contains(query.toLowerCase()) ||
                              u.name.contains(query) 
                            )).toList();

        return  ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount:suggestionList.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Color(0xFFF2929C),
                          elevation:10,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                ListTile(
                                  leading: Container(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1503066211613-c17ebc9daef0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
                                          ),
                                      ),
                                    ),
                                    title: RichText(
                                        text: TextSpan(
                                            text: suggestionList[index].name.substring(0, query.length),
                                            style: TextStyle(
                                                color: Colors.black, fontWeight: FontWeight.bold
                                            ),
                                            children: [
                                                TextSpan(
                                                    text: suggestionList[index].name.substring(query.length),
                                                    style: TextStyle(color: Colors.grey)
                                                )
                                            ]
                                        )
                                    ),
                                    subtitle: Text(suggestionList[index].about),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                ListTile(
                                    title: Text('Description'),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                ListTile(
                                    title: Text('Behavioural Information'),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                ListTile(
                                    title: Text('Habits'),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: (){
                                    },
                                  ),  
                                  SizedBox(height: 0.0,),
                                FlatButton(
                                    child: Center(
                                        child: Text(
                                      'View More',
                                        style: TextStyle(fontSize: 15,
                                        fontFamily: 'Arciform'),
                                      )
                                    ),
                                    onPressed: (){},
                                    color: Colors.black12,
                                    highlightColor: Colors.grey,
                                    padding: EdgeInsets.all(8.0),
                                 ), 
                              
                              ],
                            ),
                          )
                          );
              },
          );
      }
}

                          
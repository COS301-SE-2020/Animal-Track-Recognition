import '../../../core/viewmodels/heatmap_viewmodel.dart';
import 'package:ERP_Ranger/ui/views/confirm/confirm_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../core/services/user.dart';
import 'package:flutter/material.dart';
import '../../widgets/bottom_nav.dart';
import '../base_view.dart';


class HeatMapView extends StatefulWidget {
  HeatMapView({Key key}) : super(key: key);

  @override
  _HeatMapView createState() => _HeatMapView();
}

class _HeatMapView extends State<HeatMapView> {
  int _currentTabIndex = 2;
        String addImage = """ 
          mutation addImg(\$class: String!, \$image: String!){
            AddIMG(Classification: \$class, img: \$image){
              Kind_Of_Picture
              ID
              URL
            }
          }
        """;
  @override
  Widget build(BuildContext context) {
    BottomNavigation bottomNavigation = new BottomNavigation();
    bottomNavigation.setIndex(_currentTabIndex);

    Future<bool> _onBackPressed() async{
      if(Navigator.canPop(context)){
        Navigator.of(context).popUntil((route) => route.isFirst);
      }else{
          print("nooooo");
      }
    }

    return BaseView<HeatMapModel>(
          builder: (context, model, child) => Scaffold(
            body: WillPopScope(
                onWillPop: _onBackPressed,
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      
                      margin:  new EdgeInsets.only(top:300),
                      child: Center(
                          child: Column(
                                children: <Widget>[
                                  Mutation(
                                    options: MutationOptions(
                                      documentNode: gql(addImage),
                                      onCompleted: (dynamic resultData){
                                        print(resultData.data["AddIMG"]["ID"]);
                                          Fluttertoast.showToast(
                                            msg: "Upload to Cloud Complete",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black,
                                            fontSize: 16.0
                                          );
                                      }
                                    ),
                                    builder: (RunMutation runMutation,QueryResult result) {
                                      return IconButton(
                                        icon: Icon(Icons.cloud_upload),
                                        iconSize: 40,
                                        onPressed: () async{
                                          String url = await model.imagePicker();
                                          print(url);
                                          runMutation({
                                            'class':"",
                                            'image': url,
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  Text("Upload An Image",
                                    style: TextStyle(fontSize: 20,
                                    fontFamily: 'Arciform',
                                    fontWeight: FontWeight.normal)
                                  ),
                                ],
                              ),
                          ),
                        ),
                  ),
                    ),
                  ) ,
                  bottomNavigationBar: BottomNavigation(),
                  floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add_a_photo),
                  backgroundColor: Color(0xFFF2929C),
                  tooltip: 'Pick Image',
                  onPressed:()async{
                    List<User> animals = await model.imageID();
                    Navigator.push(context, 
                        new MaterialPageRoute(builder: (context) => ConfirmView(animal: animals,))
                    ); 
                  } 
                )
              ), 
        );
  }
}

// class FireMap extends StatefulWidget {

//   @override
//   State createState() => FireMapState();
// }

// class FireMapState extends State<FireMap> {
//   GoogleMapController mapController;
//   Position position;
//   Widget _child;

//  build(BuildContext context) {
//     return Stack(
//     children: [
//         GoogleMap(
//           initialCameraPosition: CameraPosition(
//             target: LatLng(-26.097740173,28.233989716),
//             zoom: 15
//           ),
//           onMapCreated: (GoogleMapController controller){
//               setState(() {
//                 mapController = controller;
//               });
//           },
//           myLocationEnabled: true,
//           mapType: MapType.satellite,
//           compassEnabled: true,
//         ),
//         Positioned(
//             bottom: 50,
//             left: 10,
//             child: FlatButton(
//                 child: Icon(Icons.pin_drop, color: Colors.white,),
//                 color: Colors.green,
//                 onPressed: (){
//                     var marker = Marker(
//                       icon: BitmapDescriptor.defaultMarker,
//                       infoWindow: InfoWindow(
//                         title:"Magic Marker" 
//                       ), markerId: null,
//                         //position: mapController.getScreenCoordinate(latLng)
//                     );
                  
//                 },
//             ),
//         )
//     ]);
//   }
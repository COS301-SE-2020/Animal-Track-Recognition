import '../../../core/viewmodels/heatmap_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../widgets/bottom_nav.dart';
import '../base_view.dart';


class HeatMapView extends StatefulWidget {
  HeatMapView({Key key}) : super(key: key);

  @override
  _HeatMapView createState() => _HeatMapView();
}

class _HeatMapView extends State<HeatMapView> {
  int _currentTabIndex = 2;

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
                  body: FireMap(),
                  bottomNavigationBar: BottomNavigation(),
              ),
            ), 
        )
    );
  }
}


class FireMap extends StatefulWidget {

  @override
  State createState() => FireMapState();
}

class FireMapState extends State<FireMap> {
  GoogleMapController mapController;
  Position position;
  Widget _child;

 build(BuildContext context) {
    return Stack(
    children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-26.097740173,28.233989716),
            zoom: 15
          ),
          onMapCreated: (GoogleMapController controller){
              setState(() {
                mapController = controller;
              });
          },
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          compassEnabled: true,
        ),
        Positioned(
            bottom: 50,
            left: 10,
            child: FlatButton(
                child: Icon(Icons.pin_drop, color: Colors.white,),
                color: Colors.green,
                onPressed: (){
                    var marker = Marker(
                      icon: BitmapDescriptor.defaultMarker,
                      infoWindow: InfoWindow(
                        title:"Magic Marker" 
                      ),
                        //position: mapController.getScreenCoordinate(latLng)
                    );
                  
                },
            ),
        )
    ]);
  }


}
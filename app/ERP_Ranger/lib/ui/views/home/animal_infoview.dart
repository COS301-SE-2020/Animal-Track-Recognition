import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import '../../../core/viewmodels/home_viewmodel.dart';
import '../base_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AnimalView extends StatefulWidget {
  AnimalView({Key key}) : super(key: key);

  @override
  _AnimalView createState() => _AnimalView();
}

class _AnimalView extends State<AnimalView> {
    Future<bool> _onBackPressed() async{
      if(Navigator.canPop(context)){
        Navigator.of(context).popUntil((route) => route.isFirst);
      }else{
          print("nooooo");
      }
    }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        builder: (context, model, child) => Scaffold(
          body: WillPopScope(
            onWillPop: _onBackPressed,
            child: Scaffold(
              body: FireMap(),
            ),
          )
        ),
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
          mapType: MapType.normal,
          compassEnabled: true,
        ),
        Scroll()
    ]);
  }
}

class Scroll extends StatefulWidget {

  @override
  _Scroll createState() => _Scroll();
}

class _Scroll extends State<Scroll> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.35,
      maxChildSize: 1.0,
      builder: (BuildContext context, myscrollController) {
        return Scaffold(
          
        );
      },
    );
  }
}
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../utils/mapa_style.dart';
import 'package:flutterappmaps/app/utils/mapa_style.dart';
import 'package:flutter/widgets.dart';

class PrincipalController extends ChangeNotifier{
  Map<MarkerId, Marker> _markers={};

final initialCameraPosition=
  const CameraPosition(target: LatLng(13.700446,-89.20053), zoom: 25);
 
Set<Marker> get markers=> _markers.values.toSet();
PrincipalController();
void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapaStilo);
 }

void onTap(LatLng position) {
final markerId = MarkerId (_markers.length.toString());
final maker=Marker(markerId: markerId, position: position);
  //  print(position);
  _markers[markerId]= maker;
  notifyListeners();
 }

 }
import 'package:geolocator/geolocator.dart';
class Location{
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async{
    try {
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
      Position p = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=p.latitude;
      longitude=p.longitude;
    }
    catch(e){
      print(e);
    }
  }
}
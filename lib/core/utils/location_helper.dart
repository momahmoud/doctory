import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  static Future<String> getAddress(Position? position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position.longitude);
    Placemark place = placemarks[0];
    String address =
        "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
    return address;
  }
}

import 'dart:math';

import 'package:flutter_mapbox_navigation/library.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<List<double>> getLocation();
  Future<MapBoxOptions> getOption();
  Future<List<WayPoint>> getRandomLocation();
}

class LocationRepositorySet extends LocationRepository {
  @override
  Future<List<double>> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<double> latLng;
      latLng = [position.latitude, position.longitude];
      return latLng;
    } catch (e) {
      return throw Exception("Error getting location: ${e.toString()}");
    }
  }

  Future<MapBoxOptions> getOption() async {
    MapBoxOptions _options;
    try {
      List<double> latLng = await getLocation();
      _options = MapBoxOptions(
          initialLatitude: latLng[0],
          initialLongitude: latLng[1],
          zoom: 15.0,
          tilt: 0.0,
          bearing: 0.0,
          enableRefresh: false,
          alternatives: true,
          voiceInstructionsEnabled: true,
          bannerInstructionsEnabled: true,
          allowsUTurnAtWayPoints: true,
          mode: MapBoxNavigationMode.drivingWithTraffic,
          units: VoiceUnits.imperial,
          simulateRoute: false,
          animateBuildRoute: true,
          longPressDestinationEnabled: true,
          language: "en");
      return _options;
    } catch (e) {
      return throw Exception("Error getting location: ${e.toString()}");
    }
  }

  Future<List<WayPoint>> getRandomLocation() async {
    bool findByRadius = true;
    var wayPoints = List<WayPoint>();
    var _stop1;
    var _origin;
    final random = Random();

    List<double> latLng = await getLocation();
    while (findByRadius) {
      double randomLat = latLng[0].toInt() + random.nextDouble() * 2;
      double randomLng = latLng[1].toInt() + random.nextDouble() * 2;

      double distanceInMeters = await Geolocator()
          .distanceBetween(latLng[0], latLng[1], randomLat, randomLng);

      double distanceInKm = distanceInMeters / 1000;

      //If location distance is equal to 10km, add waypoints based on random latlng
      if (distanceInKm < 11 && distanceInKm > 10) {
        findByRadius = false;
        _origin = WayPoint(
            name: "Way Point 1", latitude: latLng[0], longitude: latLng[1]);
        _stop1 = WayPoint(
            name: "Way Stop 1", latitude: randomLat, longitude: randomLng);
        wayPoints.add(_origin);
        wayPoints.add(_stop1);
      }
    }
    return wayPoints;
  }
}

import 'package:flutterChallenge/blocs/map/location_event.dart';
import 'package:flutterChallenge/blocs/map/location_state.dart';
import 'package:flutterChallenge/repositories/location_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mapbox_navigation/library.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationRepository locationRepository;

  LocationBloc({this.locationRepository}) : super(null);

  LocationState get initalState => LocationInitialState();
  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is GetLocationEvent) {
      yield LocationLoadingState();
      try {
        List<double> latLng = await locationRepository.getLocation();
        MapBoxOptions _options = await locationRepository.getOption();
        yield LocationLoadedState(latlng: latLng, options: _options);
      } catch (e) {
        yield LocationErrorState(
            message: "Error getting location: ${e.toString()}");
      }
    }
  }
}

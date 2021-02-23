import 'package:flutterChallenge/blocs/map/random_location_event.dart';
import 'package:flutterChallenge/blocs/map/random_location_state.dart';
import 'package:flutterChallenge/repositories/location_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mapbox_navigation/library.dart';

class RandomLocationBloc
    extends Bloc<RandomLocationEvent, RandomLocationState> {
  LocationRepository locationRepository;
  RandomLocationBloc({this.locationRepository}) : super(null);

  RandomLocationState get initalState => RandomLocationInititalState();
  @override
  Stream<RandomLocationState> mapEventToState(
      RandomLocationEvent event) async* {
    if (event is GetRandomLocationEvent) {
      yield RandomLocationLoadingState();
      try {
        List<WayPoint> wayPoints = await locationRepository.getRandomLocation();
        yield RandomLocationLoadedState(wayPoints: wayPoints);
      } catch (e) {
        yield RandomLocationErrorState(
            message: "Error generating random waypoint: ${e.toString()}");
      }
    }
  }
}

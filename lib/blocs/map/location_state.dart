import 'package:equatable/equatable.dart';
import 'package:flutter_mapbox_navigation/library.dart';

abstract class LocationState extends Equatable {}

class LocationInitialState extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoadingState extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoadedState extends LocationState {
  final List<double> latlng;
  final MapBoxOptions options;
  LocationLoadedState({this.latlng, this.options});
  @override
  List<Object> get props => null;
}

class LocationErrorState extends LocationState {
  final String message;
  LocationErrorState({this.message});
  @override
  List<Object> get props => null;
}

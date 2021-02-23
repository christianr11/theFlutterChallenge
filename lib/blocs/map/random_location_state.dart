import 'package:equatable/equatable.dart';
import 'package:flutter_mapbox_navigation/library.dart';

abstract class RandomLocationState extends Equatable {}

class RandomLocationInititalState extends RandomLocationState {
  @override
  List<Object> get props => [];
}

class RandomLocationLoadingState extends RandomLocationState {
  @override
  List<Object> get props => [];
}

class RandomLocationLoadedState extends RandomLocationState {
  final List<WayPoint> wayPoints;
  RandomLocationLoadedState({this.wayPoints});
  @override
  List<Object> get props => null;
}

class RandomLocationErrorState extends RandomLocationState {
  final message;
  RandomLocationErrorState({this.message});
  @override
  List<Object> get props => null;
}

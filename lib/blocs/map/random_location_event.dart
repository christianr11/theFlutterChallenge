import 'package:equatable/equatable.dart';

abstract class RandomLocationEvent extends Equatable {}

class GetRandomLocationEvent extends RandomLocationEvent {
  @override
  List<Object> get props => [];
}

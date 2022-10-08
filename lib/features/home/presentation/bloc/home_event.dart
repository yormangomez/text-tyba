part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class UniversityPageEvent extends HomeEvent {
  UniversityPageEvent();
  @override
  List<Object?> get props => [];
}

class UniversityInforEvent extends HomeEvent {
  final String pickedFile;
  UniversityInforEvent({required this.pickedFile});
  @override
  List<Object?> get props => [pickedFile];
}

class UniversityGuardarEvent extends HomeEvent {
  final String pickedFile;
  final String study;
  UniversityGuardarEvent({required this.pickedFile, required this.study});
  @override
  List<Object?> get props => [pickedFile, study];
}

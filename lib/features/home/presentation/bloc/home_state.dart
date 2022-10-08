part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  List<UniversityModel>? universityList;
  bool isUniversity;
  final String? message;
  String? picker;
  List? cantidad;

  HomeState(
      {this.universityList,
      this.isUniversity = false,
      this.message,
      this.picker,
      this.cantidad});

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  HomeInitial()
      : super(universityList: null, isUniversity: false, picker: null);
}

class HomeCodeErrorState extends HomeState {
  final String? newMessage;

  HomeCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [];
}

class UniversityState extends HomeState {
  List<UniversityModel>? newUniversityList;
  bool newIsUniversity;

  UniversityState({this.newUniversityList, required this.newIsUniversity})
      : super(
          universityList: newUniversityList,
          isUniversity: newIsUniversity,
        );
  @override
  List<Object?> get props => [];
}

class UniversityInforState extends HomeState {
  final String? newPicker;

  UniversityInforState({this.newPicker})
      : super(
          picker: newPicker,
        );
  @override
  List<Object?> get props => [];
}

class UniversityCatidadState extends HomeState {
  final List? newCantida;

  UniversityCatidadState({this.newCantida})
      : super(
          cantidad: newCantida,
        );
  @override
  List<Object?> get props => [];
}

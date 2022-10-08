import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_tyba/features/home/data/models/customer.dart';
import 'package:test_tyba/features/home/data/models/university_model.dart';
import 'package:test_tyba/features/home/domain/usecases/home_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases homeUseCases;

  HomeBloc({required this.homeUseCases}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<UniversityPageEvent>((event, emit) async {
      final resultDb = await homeUseCases.repository.getUniversity();

      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(HomeCodeErrorState(newMessage: message));
      }, (List<UniversityModel> listUniversity) {
        emit(UniversityState(
            newIsUniversity: true, newUniversityList: listUniversity));
      });
    });

    on<UniversityInforEvent>((event, emit) async {
      emit(UniversityInforState(newPicker: event.pickedFile));
    });

    on<UniversityGuardarEvent>((event, emit) async {
      //emit(UniversityInforState(newPicker: event.pickedFile));
      List list = [];
      //  list.add(Customer());
    });
  }
}

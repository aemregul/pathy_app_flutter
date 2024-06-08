import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathy_app/bloc/animal/animal_state.dart';
import 'package:pathy_app/core/services/animal_data_service.dart';
import 'package:pathy_app/model/animal_model.dart';

class AnimalCubit extends Cubit<AnimalState> {
  AnimalCubit() : super(const AnimalState(pets: [], wilds: []));
  final AnimalDataService _dataService = AnimalDataService();
  void initAnimals() async {
    List<AnimalModel> pets = await _dataService.getPets();
    List<AnimalModel> wilds = await _dataService.getWilds();
    emit(AnimalState(pets: pets, wilds: wilds));
  }
}

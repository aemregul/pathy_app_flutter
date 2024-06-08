import 'package:equatable/equatable.dart';
import 'package:pathy_app/model/animal_model.dart';

class AnimalState extends Equatable {
  final List<AnimalModel> pets;
  final List<AnimalModel> wilds;

  const AnimalState({required this.pets, required this.wilds});

  @override
  List<Object?> get props => [pets, wilds];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pathy_app/model/animal_local_model.dart';

class AnimalModel {
  final String name;
  final String species;
  final List<AnimalDescription> description;
  final String image;
  final String thumbnail;
  AnimalModel({
    required this.name,
    required this.species,
    required this.description,
    required this.image,
    required this.thumbnail,
  });
  
  AnimalModel copyWith({
    String? name,
    String? species,
    List<AnimalDescription>? description,
    String? image,
    String? thumbnail,
  }) {
    return AnimalModel(
      name: name ?? this.name,
      species: species ?? this.species,
      description: description ?? this.description,
      image: image ?? this.image,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  AnimalDescription getDescriptionByLanguage(String language) {
    return description.where((element) => element.language == language).first;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'species': species,
      'description': description,
      'image': image,
      'thumbnail': thumbnail,
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      name: map['name'] as String,
      species: map['species'] as String,
      description: (map['description'] as Map<String, dynamic>)
          .keys
          .map((key) =>
              AnimalDescription(key, map['description'][key] as String))
          .toList(),
      image: map['image'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnimalModel(name: $name, species: $species, description: ${description.toString()}, image: $image, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant AnimalModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.species == species &&
        other.description == description &&
        other.image == image &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        species.hashCode ^
        description.hashCode ^
        image.hashCode ^
        thumbnail.hashCode;
  }
}

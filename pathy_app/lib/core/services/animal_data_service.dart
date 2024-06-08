import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pathy_app/model/animal_model.dart';

class AnimalDataService {
  final String _assetPath = "assets/data/animals.json";
  Future<String> _parseAssetFile() async {
    String json = await rootBundle.loadString(_assetPath);
    return json;
  }

  Future<List<AnimalModel>> getPets() async {
    String jsonData = await _parseAssetFile();
    List<dynamic> data = (await json.decode(jsonData))['pets'];
    List<AnimalModel> animals =
        data.map((e) => AnimalModel.fromMap(e)).toList();
    return animals;
  }

  Future<List<AnimalModel>> getWilds() async {
    String jsonData = await _parseAssetFile();
    List<dynamic> data = (await json.decode(jsonData))['wilds'];
    List<AnimalModel> animals =
        data.map((e) => AnimalModel.fromMap(e)).toList();
    return animals;
  }
}

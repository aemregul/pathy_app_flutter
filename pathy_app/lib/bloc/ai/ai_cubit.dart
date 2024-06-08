import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathy_app/bloc/ai/ai_event.dart';
import 'package:pathy_app/bloc/ai/ai_state.dart';
import 'package:pathy_app/core/services/gpt_api_service.dart';
import 'package:pathy_app/model/gpt_message_model.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(const AiState(InitialAiEvent("Initial")));
  final GptApiService _dataService = GptApiService();

  Future<void> askToAi(String locale) async {
    void sendImage(File imageFile) async {
      emit(AiState(LoadingAiEvent('Loading...', imagePath: imageFile.path)));
      GPTMessageModel? model =
          await _dataService.sendAnimalImage(imageFile.path, locale);
      if (model != null) {
        emit(AiState(
            SuccessAiEvent('Success',
                response: model, imagePath: imageFile.path),
            response: model));
      } else {
        emit(const AiState(ErrorAiEvent('Error')));
      }
    }

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      result != null
          ? sendImage(File(result.files.single.path!))
          : emit(const AiState(ErrorAiEvent('Image not selected')));
    } catch (e) {
      debugPrint(e.toString());
      emit(const AiState(ErrorAiEvent('Error')));
    }
  }
}

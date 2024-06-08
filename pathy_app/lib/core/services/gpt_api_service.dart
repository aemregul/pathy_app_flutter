import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pathy_app/model/gpt_message_model.dart';

class GptApiService {
  String apiKey = "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";
  String apiURL = "https://api.openai.com/v1/chat/completions";
  String engineModel = "gpt-4-vision-preview";

  String convertBase64(String imagePath) {
    final bytes = File(imagePath).readAsBytesSync();
    return base64Encode(bytes);
  }

  Future<GPTMessageModel?> sendAnimalImage(
      String imagePath, String language) async {
    List<Map<String, dynamic>> messages = [
      {
        'role': 'system',
        'content':
            "You're just an assistant who talks about animals. Give information about the animal whose image was sent to you."
      },
      {
        'role': 'system',
        'content':
            "Give the answer in $language."
      },
      {
        'role': "user",
        'content': [
          {
            "type": "image_url",
            "image_url": {
              "url": "data:image/jpeg;base64,${convertBase64(imagePath)}"
            }
          }
        ]
      },
    ];
    try {
      final res = await http.post(
          Uri.parse(
            apiURL,
          ),
          body: jsonEncode({"model": engineModel, "messages": messages}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          });
      debugPrint(jsonDecode((res.body)).toString());
      Map<String, dynamic> data =
          jsonDecode((res.body))['choices'][0]['message'];
      GPTMessageModel message = GPTMessageModel(
          content: (utf8.decode(
            (data['content'] as String).codeUnits,
          )),
          role: convertGPTRoleType(data['role']));
      return message;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

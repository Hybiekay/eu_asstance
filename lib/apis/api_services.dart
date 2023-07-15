import 'dart:convert';
import 'dart:developer';
import 'package:uuid/uuid.dart';
import '../model/chat_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eu_assistance/apis/constant.dart/constants_key.dart';

final chatListProvider = StateProvider<List<ChatModel>>((ref) => []);
class OpenAiService {
  final List<ChatModel> messages = [];
  Future<String> isActPromtApi(String prompt) async {
    try {
      log("this is the $prompt");
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AppApiKeys.openApiKey}"
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content":
                    "Dose this message want to genarate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no."
              }
            ]
          }));

      if (res.statusCode == 200) {
        print(res.statusCode);
        print('it is s');
        var content = jsonDecode(res.body)["choices"][0]["message"]["content"];
        print(content);
        content = content.trim();
        log(content);

        switch (content) {
          case "yes":
          case "Yes":
          case "yes.":
          case "YES":
          case "Yes.":
          case 'YES.':
            final res = await dalliApi(prompt);

            log(res);
            return res;
          default:
            final res = await chatGPTApi(prompt);
            log(res);
            return res;
        }
      }
      return "An Internal error Occured";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTApi(String prompt) async {
    messages.add(ChatModel(message: prompt, isMe: true, isImage: false));
    try {
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AppApiKeys.openApiKey}"
          },
          body: jsonEncode({"model": "gpt-3.5-turbo", "messages": messages}));
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)["choices"][0]["message"]["content"];

        content = content.trim();
        log(content);
        messages.add(ChatModel(message: content, isMe: false, isImage: true));
        return content;
      }
      return "An Internal error Occured";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> dalliApi(String prompt) async {
    messages.add(ChatModel(message: prompt, isMe: true, isImage: false));
    try {
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/images/generations"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AppApiKeys.openApiKey}"
          },
          body: jsonEncode({
            "prompt": prompt,
            "n": 1,
          }));
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        String imageUrl = jsonDecode(res.body)["data"][0]["url"];

        imageUrl = imageUrl.trim();
        messages.add(ChatModel(message: imageUrl, isMe: false, isImage: true));
        return imageUrl;
      }
      return "An Internal error Occured";
    } catch (e) {
      return e.toString();
    }
  }
}

import 'package:eu_assistance/model/chat_model.dart';
import 'package:eu_assistance/apis/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = FutureProvider<List<ChatModel>>((ref) async {
  List<ChatModel> chats = [];
  List<ChatModel> chatModel = await OpenAiService().messages;
  return chats;
});

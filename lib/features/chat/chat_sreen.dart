import 'package:flutter/material.dart';
import 'chat_provider.dart/chat_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:eu_assistance/model/chat_model.dart';
import '../../global_widget.dart/loading_screen.dart';
import 'package:eu_assistance/apis/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:eu_assistance/features/chat/widget/chat_item.dart';
import 'package:eu_assistance/features/chat/widget/text_to_speech.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  final SpeechToText _speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';
  OpenAiService openAiService = OpenAiService();
  String? generatContent;
  String? generatImage;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await _speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    _speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: GoogleFonts.acme(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(child: Consumer(builder: (context, ref, child) {
          final data = ref.watch(chatListProvider.notifier).state;
          print(data);
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              ChatModel chatModel = data[index];
              // ignore: prefer_const_constructors
              return SingleChat(message: "chatModel.message", isMe: false);
            },
          );
        })),
        TextToSpeech(
          messageController: messageController,
          micOnPressed: () async {
            if (await _speechToText.hasPermission &&
                _speechToText.isNotListening) {
              await startListening();
            } else if (_speechToText.isListening) {
              await openAiService.isActPromtApi(lastWords);
              await stopListening();
            } else {
              _initSpeech();
            }
          },
          sendTextPressed: () async {
            final res = await openAiService
                .isActPromtApi(messageController.text.trim());
            var chatModel = ChatModel(
                message: messageController.text.trim(),
                isMe: true,
                isImage: false);
            print(chatModel.toString());
            ref.read(chatListProvider.notifier).state = [
              ...ref.read(chatListProvider.notifier).state,
              chatModel
            ];
            if (res.contains("https")) {
              generatImage = res;
              generatContent = null;
            } else {
              generatContent = res;
              generatImage = null;
            }
          },
        )
      ]),
    );
  }
}

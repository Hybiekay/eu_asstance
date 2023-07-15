import 'package:flutter/material.dart';
import 'package:eu_assistance/features/theme/app_color.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class TextToSpeech extends StatefulWidget {
  final VoidCallback micOnPressed;
  final VoidCallback sendTextPressed;
  final TextEditingController messageController;
  const TextToSpeech({
    Key? key,
    required this.messageController,
    required this.micOnPressed,
    required this.sendTextPressed,
  }) : super(key: key);

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  bool isChange = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (v) {
                if (v.isNotEmpty) {
                  setState(() {
                    isChange = true;
                  });
                } else {
                  setState(() {
                    isChange = false;
                  });
                }
              },
              controller: widget.messageController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColor.onPrimary(context))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          const SizedBox(width: 10),
          isChange
              ? GestureDetector(
                  onTap: widget.sendTextPressed,
                  child: CircleAvatar(
                      backgroundColor: AppColor.secondry(context),
                      radius: 25,
                      child: const Icon(Icons.send)),
                )
              : GestureDetector(
                  onTap: widget.micOnPressed,
                  onLongPress: () {},
                  child: CircleAvatar(
                      backgroundColor: AppColor.secondry(context),
                      radius: 25,
                      child: const Icon(Icons.mic)))
        ],
      ),
    );
  }
}

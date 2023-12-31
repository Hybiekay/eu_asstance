import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eu_assistance/features/theme/app_color.dart';

class SingleChat extends StatelessWidget {
  final String message;
  final bool isMe;
  const SingleChat({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
              color: isMe ? AppColor.secondry(context) : Colors.grey.shade700),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMe) ProfileCard(isMe: isMe),
                if (!isMe) const SizedBox(width: 10),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  message,
                  style: GoogleFonts.notoSerif(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
                if (isMe) ProfileCard(isMe: isMe),
                if (isMe) const SizedBox(width: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(12),
        topRight: const Radius.circular(12),
        bottomLeft: Radius.circular(isMe ? 12 : 0),
        bottomRight: Radius.circular(isMe ? 0 : 12),
      )),
      child: Icon(
        isMe ? Icons.person : Icons.computer,
        color: AppColor.onSecondry(context),
      ),
    );
  }
}

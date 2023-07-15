import 'package:flutter/material.dart';
import '../../doc/document_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eu_assistance/features/theme/app_color.dart';
import 'package:eu_assistance/features/chat/chat_sreen.dart';
import 'package:eu_assistance/features/theme/theme_switch.dart';

class DrawerWidet extends StatelessWidget {
  const DrawerWidet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColor.onPrimary(context),
                    ),
                    title: Text("Your Name",
                        style: GoogleFonts.acme(fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.onPrimary),
                      child: Center(
                          child: Text(
                        "Your Personal Assistance",
                        style: GoogleFonts.acme(fontSize: 18),
                      )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ));
              },
              leading: const CircleAvatar(),
              title: Text(
                "Chat With Me",
                style: GoogleFonts.notoSerif(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentScreen(),
                    ));
              },
              leading: const CircleAvatar(),
              title: Text(
                "Your Note Pad",
                style: GoogleFonts.notoSerif(fontSize: 18),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.question_answer_sharp),
              title: Text("I can get answer question",
                  style: GoogleFonts.notoSerif(fontSize: 15)),
            ),
            ListTile(
              leading: const Icon(Icons.image_search_outlined),
              title: Text("I can generate Image",
                  style: GoogleFonts.notoSerif(fontSize: 15)),
            ),
            ListTile(
              leading: const Icon(Icons.video_camera_front_outlined),
              title: Text("I can generate video",
                  style: GoogleFonts.notoSerif(fontSize: 15)),
            ),
            ListTile(
              leading: const Icon(Icons.switch_access_shortcut_add_outlined),
              title: Text("I can translate your audio",
                  style: GoogleFonts.notoSerif(fontSize: 15)),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: const [
                  Icon(Icons.dark_mode),
                  ThemeSwicth(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

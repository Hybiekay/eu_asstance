import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:eu_assistance/features/theme/app_color.dart';

class DocumentScreen extends ConsumerStatefulWidget {
  const DocumentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends ConsumerState<DocumentScreen> {
  quill.QuillController _controller = quill.QuillController.basic();
  TextEditingController titleEditingController =
      TextEditingController(text: "Untitle Document");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: AppColor.primary(context),
        title: Row(
          children: [
            Icon(
              Icons.edit_document,
              color: AppColor.onPrimary(context),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 140,
                child: TextFormField(
                  style: GoogleFonts.acme(color: AppColor.onPrimary(context)),
                  cursorColor: AppColor.onPrimary(context),
                  controller: titleEditingController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.onPrimary(context)))),
                ),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.share, color: AppColor.primary(context)),
                label: Text("Share",
                    style: GoogleFonts.acme(color: AppColor.primary(context)))),
          )
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(
              height: 0.5,
              decoration: BoxDecoration(color: AppColor.onPrimary(context)),
            )),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          quill.QuillToolbar.basic(
            controller: _controller,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: SizedBox(
            width: 700,
            child: Card(
              color: AppColor.backGround(context),
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: quill.QuillEditor.basic(
                  controller: _controller,
                  readOnly: false,
                ),
              ),
            ),
          ))
        ]),
      ),
    );
  }
}

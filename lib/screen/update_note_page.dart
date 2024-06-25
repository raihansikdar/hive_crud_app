import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_crud_app/controller/note_controller.dart';
import 'package:hive_crud_app/model/note_model.dart';
import 'package:hive_crud_app/screen/note_page.dart';

class UpdateNotePage extends StatefulWidget {
  final int index;
  final String title;
  final String content;
  const UpdateNotePage({super.key, required this.title, required this.content, required this.index});

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _contentTEController = TextEditingController();



  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _titleTEController.text = widget.title;
      _contentTEController.text = widget.content;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleTEController,
              decoration: InputDecoration(
                  hintText: 'title',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _contentTEController,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: 'content',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<NoteController>(
                    builder: (_noteController) {
                      return ElevatedButton(
                          onPressed: () {
                            _noteController.updateNote(widget.index, Note(
                              title: _titleTEController.text,
                              content: _contentTEController.text,
                            ));
                            _titleTEController.clear();
                            _contentTEController.clear();
                          },
                          child: const Text("Update"));
                    }
                ),
                const SizedBox(
                  width: 16.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(NotePage());
                    },
                    child: const Text("See")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

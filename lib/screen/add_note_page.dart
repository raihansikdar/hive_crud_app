import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_crud_app/controller/note_controller.dart';
import 'package:hive_crud_app/model/note_model.dart';
import 'package:hive_crud_app/screen/note_page.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _contentTEController = TextEditingController();

  //final NoteController noteController = Get.put(NoteController());

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
                          _noteController.createNote(Note(
                            title: _titleTEController.text,
                            content: _contentTEController.text,
                          ));
                          _titleTEController.clear();
                          _contentTEController.clear();
                        },
                        child: const Text("add"));
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_crud_app/controller/note_controller.dart';
import 'package:hive_crud_app/screen/update_note_page.dart';


class NotePage extends StatefulWidget {
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  //final NoteController noteController = Get.put(NoteController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<NoteController>().readNotes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive GetX Example'),
      ),
      body: GetBuilder<NoteController>(
        builder: (_noteController) {
          return ListView.builder(
                itemCount: _noteController.readNotes().length,
                itemBuilder: (context, index) {
                  final note = _noteController.readNotes()[index];
                  return ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.content),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Get.to(UpdateNotePage(index: index,title: _noteController.readNotes()[index].title, content: _noteController.readNotes()[index].content,));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                          _noteController.deleteNote(index);
                          _noteController.readNotes();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
        }
      ));
        }

}


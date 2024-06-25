import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_crud_app/model/note_model.dart';

class NoteController extends GetxController {
  late Box<Note> noteBox;
  var isLoading = true;

  @override
  void onInit() {
    super.onInit();
    Hive.registerAdapter(NoteAdapter());
    openBox();
  }

  Future<void> openBox() async {
    noteBox = await Hive.openBox<Note>('noteBox');
    isLoading = false; // Set loading to false when box is opened
  }

  void createNote(Note note) {
    noteBox.add(note);
    update();
  }

  List<Note> readNotes() {
    return noteBox.values.toList();
  }

  void updateNote(int index, Note note) {
    noteBox.putAt(index, note);
    update();
  }

  void deleteNote(int index) {
    noteBox.deleteAt(index);
    update();
  }
}

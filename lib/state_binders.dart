import 'package:get/get.dart';
import 'package:hive_crud_app/controller/note_controller.dart';


class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(NoteController());

  }

}
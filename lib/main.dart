import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_crud_app/screen/add_note_page.dart';
import 'package:hive_crud_app/state_binders.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: StateHolderBinder(),
      title: 'Hive GetX Example',
      home: const AddNotePage(),
    );
  }
}
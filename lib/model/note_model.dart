import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  Note({
    required this.title,
    required this.content,
  });
}

/*
flutter clean
flutter packages pub get
flutter packages pub run build_runner build
*/

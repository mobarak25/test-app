import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

//Date DateFormat===============
String getDate({required String value, required String formate}) {
  DateTime tempDate = DateTime.parse(value);
  return DateFormat(formate).format(tempDate);
}

//Multipart Image===============
class ImageFile {
  const ImageFile({required this.name, required this.file});

  final String name;
  final XFile file;
}

// Check plural=============================
extension PluralExtension on num {
  String plural(String singularWord, [String pluralLetters = "s"]) {
    return this > 1
        ? "$this $singularWord$pluralLetters"
        : "$this $singularWord";
  }
}

class DropdownItem {
  const DropdownItem({required this.name, required this.value});
  final String name;
  final dynamic value;
}

class PopupItem {
  const PopupItem({required this.title, required this.value});

  final String title;
  final String value;
}

// Debouncer=================

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

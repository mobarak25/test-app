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

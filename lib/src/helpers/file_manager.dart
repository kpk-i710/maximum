import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileManager {
  static FileManager? _instace;

  FileManager._interval() {
    _instace = this;
  }

  factory FileManager() => _instace ?? FileManager._interval();

  Future<String> get _directoryPath async {
    Directory? directory = await getExternalStorageDirectory();
    return directory!.path;
  }


   writeJsonFile() async {
    // File file =  await _jsonFile;
    // await file.writeAsString(contents)

   }
}

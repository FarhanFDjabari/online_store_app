import 'dart:io';

String readJson(String name) {
  return File(findFile(name)).readAsStringSync();
}

String findFile(String filename) {
  var dir = Directory('.');
  var directory = '';
  List allContents = dir.listSync(recursive: true);
  for (var fileOrDir in allContents) {
    if (fileOrDir.path.endsWith(filename)) {
      directory = fileOrDir.path;
    }
  }

  return directory;
}

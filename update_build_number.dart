import 'dart:io';

void main() {
  final buildNumber = DateTime.now().millisecondsSinceEpoch.toString();
  final filePath = 'web/index.html';
  final file = File(filePath);

  if (file.existsSync()) {
    var content = file.readAsStringSync();
    content = content.replaceAll(RegExp(r'flutter_bootstrap.js\?v=\d+'), 'flutter_bootstrap.js?v=$buildNumber');
    file.writeAsStringSync(content);
    print('Updated build number to $buildNumber in $filePath');
  } else {
    print('File not found: $filePath');
  }
}
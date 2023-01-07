// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
//     GlobalKey<ScaffoldMessengerState>();

// final _messengerKey = GlobalKey<ScaffoldMessengerState>();
// showSnackBar(String text) {
//   _messengerKey.currentState?.showSnackBar(
//     SnackBar(
//       content: Text(text),
//     ),
//   );
// }

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

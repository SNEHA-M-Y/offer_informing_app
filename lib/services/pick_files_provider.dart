import "dart:developer";
import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:file_picker/file_picker.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";
// import "package:provider/provider.dart";

class PickFilesProvider with ChangeNotifier {
  String filePath = '';
  String fileName = '';
  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["jpg", "jpeg", "png"],
        type: FileType.custom);
    if (result == null) return;
    filePath = result.files.first.path.toString();
    fileName = result.files.first.name;
    log(result.files.first.name.toString(), name: "name");
    log(result.files.first.size.toString(), name: "size");
    log(result.files.first.path.toString(), name: "path");
    notifyListeners();
  }

  UploadTask? uploadTask;
  String urlDownload = '';
  Future<void> upLoadfile(context, productName, Description) async {
    log("----");
    final path = 'productImage/$fileName';

    log(path, name: "path");
    final file = File(filePath);
    log(file.toString(), name: "file");
    try {
      log("....", name: "try");
      final ref = FirebaseStorage.instance.ref().child(path);
      log("1");
      uploadTask = ref.putFile(file);
      log("2");
      final snapshot = await uploadTask!.whenComplete(() {
        log("complete");
      });
      log('3');
      urlDownload = await snapshot.ref.getDownloadURL();
      log(urlDownload, name: "Image Download Link");

      FirebaseFirestore.instance.collection("Products").doc().set({
        'image': urlDownload,
        'productName': productName,
        'Description': Description,
      }).then((value) {
        const snackBar = SnackBar(
          backgroundColor: Color.fromARGB(255, 32, 84, 196),
          content: Text(
            'Products Updated..',
            textAlign: TextAlign.center,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } catch (e) {
      log('error');
    }
  }

  // @override
  // notifyListeners();
}

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as pathlib;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

abstract class FileRepository {
  Future<String?> uploadFile(String localFile, Uint8List bytes, String path);
}

class FirebaseFileRepository extends FileRepository {

  @override
  Future<String?> uploadFile(String localFile, Uint8List bytes, String path) async {

    final storageRef = FirebaseStorage.instance.ref();

    final uploadFile = '$path/${const Uuid().v4()}${pathlib.extension(localFile)}';
    final uploadFileRef = storageRef.child(uploadFile);

    try {
      await uploadFileRef.putData(bytes, SettableMetadata(
        contentType: mime(localFile)
      ));
      return await uploadFileRef.getDownloadURL();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

}
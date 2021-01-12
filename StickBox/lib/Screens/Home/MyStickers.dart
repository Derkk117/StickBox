import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:StickBox/Services/Auth.dart';

class MyStickers extends StatefulWidget {
  @override
  _MyStickersState createState() => _MyStickersState();
}

class _MyStickersState extends State<MyStickers> {
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await ImagePicker().getImage(source: source);

    setState(() {
      _imageFile = File(selected.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthService service = AuthService();
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        if (_imageFile != null) ...[
          Image.file(
            _imageFile,
            width: size.width / 3,
          ),
        ],
        FloatingActionButton(
            elevation: 5,
            child: Icon(Icons.add_a_photo),
            onPressed: () {
              _pickImage(ImageSource.gallery);
              final FirebaseStorage _storage = FirebaseStorage.instanceFor(
                  bucket: "gs://stickbox.appspot.com/");

              String filePath = '${service.getEmail()}/${DateTime.now()}.webp';

              UploadTask _upload =
                  _storage.ref().child(filePath).putFile(_imageFile);

              print("ok");
            })
      ],
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);
  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "MyStickers");

  void startUpload() async {
    String filePath = 'images/${DateTime.now()}.webp';

    UploadTask _upload = _storage.ref().child(filePath).putFile(widget.file);

    print("ok");
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: startUpload,
      child: Text(
        "Subir",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

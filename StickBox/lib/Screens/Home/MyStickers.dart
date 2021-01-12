import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:StickBox/Services/Auth.dart';

AuthService service = AuthService();

class MyStickers extends StatefulWidget {
  @override
  _MyStickersState createState() => _MyStickersState();
}

class _MyStickersState extends State<MyStickers> {
  File _imageFile;
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await ImagePicker().getImage(source: source);

    setState(() {
      _imageFile = File(selected.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        _buildBody(context),
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

              _upload.whenComplete(() => _addPathToDatabase(filePath));
            })
      ],
    );
  }

  Future<QuerySnapshot> getImages() {
    return fb.collection("images").get();
  }

  Future<void> _addPathToDatabase(path) async {
    try {
      // Get image URL from firebase
      final FirebaseStorage _storage =
          FirebaseStorage.instanceFor(bucket: "gs://stickbox.appspot.com/");

      final ref = _storage.ref(path);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance
          .collection(service.getEmail())
          .doc()
          .set({'url': imageString, 'location': path});
    } catch (e) {
      print(e.message);
    }
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection(service.getEmail()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Column(
        children:
            snapshot.map((data) => _buildListItem(context, data)).toList());
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 100,
      width: size.width / 3,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white),
      child: Image.network(record.url),
    );
  }
}

class Record {
  final String location;
  final String url;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        url = map['url'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$location:$url>";
}

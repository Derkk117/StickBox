import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadSticker extends StatefulWidget {
  @override
  _UploadStickerState createState() => _UploadStickerState();
}

class _UploadStickerState extends State<UploadSticker> {
  PickedFile _imageFile;
  dynamic _pickImageError;

  String _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    await _displayPickImageDialog(context,
        (double maxWidth, double maxHeight, int quality) async {
      try {
        final pickedFile = await _picker.getImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: quality,
        );
        setState(() {
          _imageFile = pickedFile;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    });
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (_imageFile.path.contains(".webp")) {
        return Container(
          child: ListView(
            children: <Widget>[
              Image.file(
                File(_imageFile.path),
                width: 350,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(
                height: 80,
              ),
              FlatButton(
                  height: 80,
                  color: Colors.indigo,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300),
                    ),
                  )),
            ],
          ),
          //child: Image.file(File(_imageFile.path)),
        );
      } else {
        return /*Text(
          'You have not yet picked a Sticker (file type `.webp`).',
          textAlign: TextAlign.center,
        )*/
            Container(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'You have not yet picked a Sticker (file type `.webp`).',
              style: TextStyle(color: Colors.lightBlue, fontSize: 25),
            ),
          ),
        );
      }
    } else if (_pickImageError != null) {
      return /*Text(
        'Pick Sticker error: $_pickImageError',
        textAlign: TextAlign.center,
      )*/
          Container(
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Pick Sticker error: $_pickImageError',
              style: TextStyle(color: Colors.lightBlue, fontSize: 25),
            )),
      );
    } else {
      return /*const Text(
        'You have not yet picked a Sticker.',
        textAlign: TextAlign.center,
      )*/
          Container(
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'You have not picked a Sticker',
              style: TextStyle(color: Colors.lightBlue, fontSize: 25),
            )),
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.image) {
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Upload Sticker'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Text(
                        'You have not yet picked a Sticker.',
                        textAlign: TextAlign.center,
                      );
                    case ConnectionState.done:
                      return _previewImage();
                    default:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick Sticker error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text(
                          'You have not yet picked a Sticker.',
                          textAlign: TextAlign.center,
                        );
                      }
                  }
                },
              )
            : (_previewImage()),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            label: 'image_picker_example_from_gallery',
            child: FloatingActionButton(
              onPressed: () {
                _onImageButtonPressed(ImageSource.gallery, context: context);
              },
              heroTag: 'image0',
              tooltip: 'Pick Sticker from gallery',
              child: const Icon(Icons.add),
              backgroundColor: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
                'Add Stickers from device/WhatsApp/Media/WhatsApp Stickers'),
            /*content: Column(
              children: <Widget>[
              ],
            ),*/
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                  child: Text('PICK'),
                  onPressed: () {
                    double width;
                    double height;
                    int quality;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

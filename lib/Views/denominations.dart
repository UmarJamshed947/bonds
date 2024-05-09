import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Denominations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Image Layout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildImageWidget(context, 'assets/images/100.png'),
            SizedBox(height: 10),
            _buildImageWidget(context, 'assets/images/200.png'),
            SizedBox(height: 10),
            _buildImageWidget(context, 'assets/images/750.png'),
            SizedBox(height: 10),
            _buildImageWidget(context, 'assets/images/1500.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(BuildContext context, String assetPath) {
    return GestureDetector(
      onTap: () {
        _showImageDialog(context, assetPath);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String assetPath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Image.asset(assetPath, fit: BoxFit.contain),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            MaterialButton(
              onPressed: () {
                _saveImageToDevice(context, assetPath);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveImageToDevice(BuildContext context, String assetPath) async {
    final ByteData bytes = await rootBundle.load(assetPath);
    final Uint8List list = bytes.buffer.asUint8List();
    final result = await ImageGallerySaver.saveImage(list);
    if (result != null && result.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image saved successfully'),
        ),
      );
      Navigator.of(context).pop(); // Close the dialog
    }
  }
}



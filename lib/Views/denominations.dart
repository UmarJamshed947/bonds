import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../Widgets/customtext.dart';
import 'Dashboard.dart';

class Denominations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color(0xFF2196F3),
        elevation: 3,
        title: CustomText(txt:'Denominations',fntSize: 22),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
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
          backgroundColor: Colors.grey,
          content: Image.asset(assetPath, fit: BoxFit.contain),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: CustomText(txt: 'Close'),
              color: Color(0xFFF32152),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _saveImageToDevice(context, assetPath);
              },
              child: CustomText(txt: 'Save'),
              color: Color(0xFF2196F3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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



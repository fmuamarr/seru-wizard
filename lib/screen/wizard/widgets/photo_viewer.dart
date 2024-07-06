import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:image_picker/image_picker.dart';

class PhotoViewer extends StatelessWidget {
  final XFile photo;

  const PhotoViewer({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Viewer')),
      body: Center(
        child: PhotoView(
          imageProvider: FileImage(File(photo.path)),
        ),
      ),
    );
  }
}

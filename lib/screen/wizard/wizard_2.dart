import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:seru_wizard/core/constants/color_constant.dart';
import 'package:seru_wizard/core/services/input_state.dart';
import 'package:seru_wizard/screen/wizard/widgets/photo_viewer.dart';
import 'package:seru_wizard/screen/wizard/wizard_3.dart';

class WizardScreen2 extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  WizardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InputData>(
      builder: (context, wizardData, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wizard 2'),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _photoPicker(context, 'Foto Selfie', wizardData.fotoSelfie,
                      (file) {
                    wizardData.updatePhotos(
                        file, wizardData.fotoKTP, wizardData.fotoBebas);
                  }),
                  _photoPicker(context, 'Foto KTP', wizardData.fotoKTP, (file) {
                    wizardData.updatePhotos(
                        wizardData.fotoSelfie, file, wizardData.fotoBebas);
                  }),
                  _photoPicker(context, 'Foto Bebas', wizardData.fotoBebas,
                      (file) {
                    wizardData.updatePhotos(
                        wizardData.fotoSelfie, wizardData.fotoKTP, file);
                  }),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.lightPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      //berhubung belum menggunakan OCR ML Kit masih menggunakan placeholder
                      wizardData.updateKtpNumber('1234567890');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WizardScreen3()));
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _photoPicker(BuildContext context, String label, XFile? photo,
      Function(XFile?) onPicked) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () async {
                XFile? pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  onPicked(pickedFile);
                }
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                  image: photo != null
                      ? DecorationImage(
                          image: FileImage(File(photo.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: photo == null
                    ? const Icon(Icons.add_a_photo,
                        size: 50, color: Colors.grey)
                    : null,
              ),
            ),
            if (photo != null)
              Center(
                child: TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoViewer(photo: photo))),
                  child: Text(
                    'View Photo',
                    style: TextStyle(color: ColorConstants.lightPrimaryColor),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

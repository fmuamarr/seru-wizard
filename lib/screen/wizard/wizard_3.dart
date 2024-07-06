import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:seru_wizard/core/services/input_state.dart';
import 'package:seru_wizard/screen/wizard/widgets/photo_viewer.dart';

import '../../core/constants/color_constant.dart';

class WizardScreen3 extends StatelessWidget {
  const WizardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InputData>(
      builder: (context, wizardData, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wizard 3'),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width -
                          32, // Device width minus padding
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Overview',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 8.0),
                          Text('First Name: ${wizardData.firstName}'),
                          Text('Last Name: ${wizardData.lastName}'),
                          Text('Biodata: ${wizardData.biodata}'),
                          Text('Provinsi: ${wizardData.provinsi}'),
                          Text('Kota: ${wizardData.kota}'),
                          Text('Kecamatan: ${wizardData.kecamatan}'),
                          Text('Kelurahan: ${wizardData.kelurahan}'),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _photoPreview(context, 'Foto Selfie',
                                  wizardData.fotoSelfie),
                              _photoPreview(
                                  context, 'Foto KTP', wizardData.fotoKTP),
                              _photoPreview(
                                  context, 'Foto Bebas', wizardData.fotoBebas),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Data JSON',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 8.0),
                          Text(wizardData.toJson().toString()),
                        ],
                      ),
                    ),
                  ),
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
                      // Send data to API
                    },
                    child: const Text(
                      'Send to API',
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

  Widget _photoPreview(BuildContext context, String label, XFile? photo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            if (photo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewer(photo: photo),
                ),
              );
            }
          },
          child: photo == null
              ? Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: const Icon(Icons.photo, color: Colors.white),
                )
              : Image.file(File(photo.path), width: 100, height: 100),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

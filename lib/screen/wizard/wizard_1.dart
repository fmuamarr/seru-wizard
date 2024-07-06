import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';
import 'package:seru_wizard/core/constants/color_constant.dart';
import 'package:seru_wizard/core/data/api/api.dart';
import 'package:seru_wizard/core/services/input_state.dart';
import 'package:seru_wizard/core/models/provinsi_model.dart';
import 'package:seru_wizard/screen/wizard/wizard_2.dart';

class WizardScreen1 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  WizardScreen1({super.key});

  final List<String> _kotaList = ['Kota 1', 'Kota 2', 'Kota 3'];
  final List<String> _kecamatanList = [
    'Kecamatan 1',
    'Kecamatan 2',
    'Kecamatan 3'
  ];
  final List<String> _kelurahanList = [
    'Kelurahan 1',
    'Kelurahan 2',
    'Kelurahan 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<InputData>(
      builder: (context, wizardData, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wizard 1'),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: TextFormField(
                        decoration: decorationForm("First Name", Icons.person),
                        initialValue: wizardData.firstName,
                        onSaved: (value) => wizardData.updatePersonalInfo(
                            value, wizardData.lastName, wizardData.biodata),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: TextFormField(
                        decoration: decorationForm("Last Name", Icons.person),
                        initialValue: wizardData.lastName,
                        onSaved: (value) => wizardData.updatePersonalInfo(
                            wizardData.firstName, value, wizardData.biodata),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: TextFormField(
                        decoration: decorationForm("Bio", Icons.note),
                        initialValue: wizardData.biodata,
                        onSaved: (value) => wizardData.updatePersonalInfo(
                            wizardData.firstName, wizardData.lastName, value),
                        maxLines: 5,
                        minLines: 3,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    FutureBuilder<List<ProvinsiModel>>(
                      future: ApiService().fetchProvinces(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final provinces = snapshot.data!;
                          return SearchChoices.single(
                            fieldDecoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                            items: provinces
                                .map((provinsi) => DropdownMenuItem(
                                      value: provinsi.id,
                                      child: Text(provinsi.name),
                                    ))
                                .toList(),
                            value: wizardData.provinsi,
                            hint: 'Select Provinsi',
                            searchHint: 'Type to search',
                            onChanged: (value) => wizardData.updateLocation(
                                value,
                                wizardData.kota,
                                wizardData.kecamatan,
                                wizardData.kelurahan),
                            isExpanded: true,
                            displayClearIcon: false,
                            selectedValueWidgetFn: (item) {
                              return Text(
                                  'Provinsi: ${provinces.firstWhere((provinsi) => provinsi.id == item).name}');
                            },
                          );
                        }
                      },
                    ),
                    SearchChoices.single(
                      fieldDecoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      items: _kotaList
                          .map((kota) => DropdownMenuItem(
                                value: kota,
                                child: Text(kota),
                              ))
                          .toList(),
                      value: wizardData.kota,
                      hint: 'Select Kota',
                      searchHint: 'Type to search',
                      onChanged: (value) => wizardData.updateLocation(
                          wizardData.provinsi,
                          value,
                          wizardData.kecamatan,
                          wizardData.kelurahan),
                      isExpanded: true,
                      displayClearIcon: false,
                      selectedValueWidgetFn: (item) {
                        return Text('Kota: $item');
                      },
                    ),
                    SearchChoices.single(
                      fieldDecoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      items: _kecamatanList
                          .map((kecamatan) => DropdownMenuItem(
                                value: kecamatan,
                                child: Text(kecamatan),
                              ))
                          .toList(),
                      value: wizardData.kecamatan,
                      hint: 'Select Kecamatan',
                      searchHint: 'Type to search',
                      onChanged: (value) => wizardData.updateLocation(
                          wizardData.provinsi,
                          wizardData.kota,
                          value,
                          wizardData.kelurahan),
                      isExpanded: true,
                      displayClearIcon: false,
                      selectedValueWidgetFn: (item) {
                        return Text('Kecamatan: $item');
                      },
                    ),
                    SearchChoices.single(
                      fieldDecoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      items: _kelurahanList
                          .map((kelurahan) => DropdownMenuItem(
                                value: kelurahan,
                                child: Text(kelurahan),
                              ))
                          .toList(),
                      value: wizardData.kelurahan,
                      hint: 'Select Kelurahan',
                      searchHint: 'Type to search',
                      onChanged: (value) => wizardData.updateLocation(
                          wizardData.provinsi,
                          wizardData.kota,
                          wizardData.kecamatan,
                          value),
                      isExpanded: true,
                      displayClearIcon: false,
                      selectedValueWidgetFn: (item) {
                        return Text('Kelurahan: $item');
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.lightPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WizardScreen2()),
                            );
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

InputDecoration decorationForm(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon),
    contentPadding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
    filled: true,
    fillColor: Colors.white,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.grey,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.black26,
      ),
    ),
    hintText: hintText,
  );
}

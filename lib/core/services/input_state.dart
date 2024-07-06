import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputData with ChangeNotifier {
  String? firstName;
  String? lastName;
  String? biodata;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  String? ktpNumber;

  XFile? fotoSelfie;
  XFile? fotoKTP;
  XFile? fotoBebas;

  void updatePersonalInfo(String? fName, String? lName, String? bio) {
    firstName = fName;
    lastName = lName;
    biodata = bio;
    notifyListeners();
  }

  void updateLocation(
      String? prov, String? city, String? district, String? subdistrict) {
    provinsi = prov;
    kota = city;
    kecamatan = district;
    kelurahan = subdistrict;
    notifyListeners();
  }

  void updatePhotos(XFile? selfie, XFile? ktp, XFile? bebas) {
    fotoSelfie = selfie;
    fotoKTP = ktp;
    fotoBebas = bebas;
    notifyListeners();
  }

  void updateKtpNumber(String? number) {
    ktpNumber = number;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'biodata': biodata,
      'provinsi': provinsi,
      'kota': kota,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'ktpNumber': ktpNumber,
    };
  }
}

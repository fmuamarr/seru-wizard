import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seru_wizard/core/models/provinsi_model.dart';

class ApiService {
  final http.Client httpClient;

  static const String _baseUrl = 'https://api.binderbyte.com/wilayah';
  static const String _provinsiUrl = '/provinsi';
  static const String _apiKey =
      '1e129ef1eda86d3446037cc7b1c2a86704615c94f74aa3de5bb7945cca64cb37';

  ApiService({http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  Future<List<ProvinsiModel>> fetchProvinces() async {
    final response = await httpClient.get(
      Uri.parse('$_baseUrl$_provinsiUrl?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['value'];
      return data.map((json) => ProvinsiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load provinces');
    }
  }

  //Fetch data kabupaten/kota, desa, dll belum diimplementasikan
}

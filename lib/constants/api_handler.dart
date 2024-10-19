import 'dart:convert';

import 'package:nimap_app/models/record_model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri = 'https://testffc.nimapinfotech.com/testdata.json';

  // Method to get data from database
  Future<List<RecordModel>> getRecords() async {
    List<RecordModel> data = [];
    final uri = Uri.parse(baseUri);

    try {
      // storing api response:
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final List<dynamic> jsonData =
            json.decode(response.body)['data']['Records'];

        // converting json data into Record model object
        data = jsonData.map((json) => RecordModel.fromJson(json)).toList();
        return data;
      }
    } catch (e) {
      throw Exception('Failed to load records');
    }

    return data;
  }

  // Method to update data
  Future updateRecord() async {}

  // Method to add data
  Future addRecord() async {}

  // Method to delete data
  Future deleteRecord() async {}

  // Method to get data iwth id
  Future getRecordById({required int recordId}) async {}
}

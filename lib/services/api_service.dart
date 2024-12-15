// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService(dio) {
    // AVD
    // _dio.options.baseUrl = 'http://10.0.2.2:5000/';

    // NON AVD
    // _dio.options.baseUrl = 'http://127.0.0.1:5000/';

    // LIVE
    _dio.options.baseUrl = 'https://ferdyapriliyanto.pythonanywhere.com/';
  }

  Future<Uint8List?> filterImage(XFile file,
      {required String filterType}) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file.path, filename: file.name)
      });

      var endpoint = '';
      if (filterType == 'Grayscale') {
        endpoint = '/grayscale-filter';
      } else if (filterType == 'Invert') {
        endpoint = '/invert-filter';
      } else if (filterType == 'Sepia') {
        endpoint = '/sepia-filter';
      }

      final response = await _dio.post(endpoint,
          data: formData, options: Options(responseType: ResponseType.bytes));
      print('File uploaded: ${response.data}');

      return response.data;
    } catch (e) {
      print('Error receiving file: $e');
      return null;
    }
  }
}

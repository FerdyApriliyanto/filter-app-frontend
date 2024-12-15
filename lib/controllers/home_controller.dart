import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:filter_app/screens/result_screen.dart';
import 'package:filter_app/services/api_service.dart';

class HomeController extends GetxController {
  Rxn<XFile> imagePicked = Rxn<XFile>();

  final ApiService apiService = ApiService(Dio());

  Future<void> pickImage({required String imgSource}) async {
    final ImagePicker picker = ImagePicker();
    final img = await picker.pickImage(
        source:
            imgSource == 'Gallery' ? ImageSource.gallery : ImageSource.camera);

    if (img == null) {
      return;
    }

    imagePicked.value = img;
  }

  Future<void> sendImage(String filterType) async {
    if (imagePicked.value == null) {
      return;
    }

    Get.defaultDialog(
        title: '',
        backgroundColor: Colors.white,
        content: const Center(
          child: Column(
            children: [
              CircularProgressIndicator(color: Colors.black,),
              SizedBox(
                height: 12,
              ),
              Text('Processing Your Image...')
            ],
          ),
        ));

    final res = await apiService.filterImage(imagePicked.value!,
        filterType: filterType);

    Get.back();

    if (res != null) {
      await Get.to(() => ResultScreen(
            filteredImg: res,
          ));
    } else {
      Get.defaultDialog(
          title: 'Error!',
          content: const Text(
            'The server might temporarily closed or check your internet connection. Please try again',
            textAlign: TextAlign.center,
          ));
    }
  }

  void deleteImage() => imagePicked.value = null;
}

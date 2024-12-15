import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:filter_app/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.imagePicked.value != null
                ? SizedBox(
                    height: 350,
                    width: 400,
                    child: Image.file(File(controller.imagePicked.value!.path)))
                : const SizedBox(),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () => _showImagePickerOption(context),
                    child: Text(controller.imagePicked.value != null
                        ? 'Change Image'
                        : 'Pick Image')),
                controller.imagePicked.value != null
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white),
                              onPressed: () => _showFilterOptions(context),
                              child: const Text('Send'))
                        ],
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            controller.imagePicked.value == null
                ? const SizedBox()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    onPressed: () => controller.deleteImage(),
                    child: const Text('Delete Image')),
          ],
        ),
      )),
    );
  }

  void _showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.pickImage(imgSource: 'Gallery');
                },
                child: Container(
                  height: 126,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera_back_outlined),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Gallery'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 0.5,
              height: 126,
              color: Colors.black,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.pickImage(imgSource: 'Camera');
                },
                child: Container(
                  height: 126,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Camera'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.sendImage('Grayscale');
                },
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Grayscale'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 0.5,
              height: 80,
              color: Colors.black,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.sendImage('Invert');
                },
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Invert'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 0.5,
              height: 80,
              color: Colors.black,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.sendImage('Sepia');
                },
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sepia'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

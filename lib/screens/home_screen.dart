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
        title: const Text('Filter App'),
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
                    onPressed: () => controller.pickImage(),
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
                              onPressed: () => _showSnackbar(context),
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

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Expanded(child: Text('Choose filter:')),
          TextButton(
            onPressed: () {
              controller.sendImage('Grayscale');
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child:
                const Text('Grayscale', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              controller.sendImage('Invert');
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Text('Invert', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              controller.sendImage('Sepia');
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Text('Sepia', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
      duration: const Duration(seconds: 7),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

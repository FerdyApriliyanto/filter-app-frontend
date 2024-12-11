import 'dart:typed_data';

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Uint8List filteredImg;

  const ResultScreen({super.key, required this.filteredImg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          centerTitle: true,
          scrolledUnderElevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                  height: 350, width: 400, child: Image.memory(filteredImg))
            ],
          ),
        ));
  }
}

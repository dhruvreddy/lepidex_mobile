import 'dart:io';

import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final File imageFile;
  const ImageSection({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(imageFile, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

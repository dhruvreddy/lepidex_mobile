import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lepidex/core/theme/app_pallete.dart';
import 'package:lepidex/features/scan/presentation/bloc/scan_bloc.dart';

void showImageSourceDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: AppPallete.gradient3,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text('Take a Photo'),
              onTap: () {
                Navigator.of(context).pop('camera');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.of(context).pop('gallery');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.close, color: Colors.red),
              title: const Text('Cancel'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  ).then((value) {
    if (value == 'camera') {
      context.read<ScanBloc>().add(AddImageFromCameraEvent());
    } else if (value == 'gallery') {
      context.read<ScanBloc>().add(AddImageFromGalleryEvent());
    }
  });
}

import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lepidex/core/theme/app_pallete.dart';
import 'package:lepidex/features/scan/presentation/bloc/scan_bloc.dart';
import 'package:lepidex/features/scan/presentation/widgets/action_button.dart';
import 'package:lepidex/features/scan/presentation/widgets/details_section.dart';
import 'package:lepidex/features/scan/presentation/widgets/image_section.dart';
import 'package:lepidex/features/scan/presentation/widgets/show_image_source_dialog.dart';

class ImageScanPage extends StatefulWidget {
  const ImageScanPage({super.key});

  @override
  State<ImageScanPage> createState() => _ImageScanPageState();
}

class _ImageScanPageState extends State<ImageScanPage> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanBloc, ScanState>(
      listener: (context, state) {
        if (state is ImageSavedState) {}
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lepidex"),
          actions: [
            Padding(
              padding: EdgeInsets.all(8),
              child: IconButton(
                onPressed: () => showImageSourceDialog(context),
                icon: Icon(Icons.add_a_photo),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<ScanBloc, ScanState>(
                builder: (context, state) {
                  if (state is ImageAddedFromCameraState && state.xFile != null) {
                    return ImageSection(
                      imageFile: File(state.xFile!.path),
                    );
                  } else if (state is ImageAddedFromGalleryState && state.xFile != null) {
                    return ImageSection(
                      imageFile: File(state.xFile!.path),
                    );
                  } else if (state is ReadyForScanState && state.xFile != null) {
                    return ImageSection(
                      imageFile: File(state.xFile!.path),
                    );
                  } else if (state is ImageDetailsState && state.xFile != null) {
                    return ImageSection(
                      imageFile: File(state.xFile!.path),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Please select an image",
                          style: TextStyle(
                            fontSize: 25,
                            color: AppPallete.whiteColor,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              BlocBuilder<ScanBloc, ScanState>(
                builder: (context, state) {
                  if (state is ImageDetailsState && state.xFile != null) {
                    return DetailsSection(scanButterflyEntity: state.scanButterflyEntity);
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 380,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                "No data to be shown",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: AppPallete.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              ActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}

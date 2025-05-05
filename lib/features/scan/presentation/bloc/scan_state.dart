part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class AddImageFromCameraState extends ScanState {}

class ImageAddedFromCameraState extends ScanState {
  final XFile? xFile;

  const ImageAddedFromCameraState({
    required this.xFile,
  });
}

class ReadyForScanState extends ScanState {
  final XFile? xFile;

  const ReadyForScanState({
    required this.xFile,
  });
}

class AddImageFromGalleryState extends ScanState {}

class ImageAddedFromGalleryState extends ScanState {
  final XFile? xFile;

  const ImageAddedFromGalleryState({
    required this.xFile,
  });
}

class ImageDetailsState extends ScanState {
  final ScanButterflyEntity scanButterflyEntity;
  final XFile? xFile;

  const ImageDetailsState({
    required this.scanButterflyEntity,
    required this.xFile,
  });
}

class ImageErrorState extends ScanState {
  final String error;

  const ImageErrorState({
    required this.error,
  });
}

class SaveImageState extends ScanState {}

class ImageSavedState extends ScanState {}

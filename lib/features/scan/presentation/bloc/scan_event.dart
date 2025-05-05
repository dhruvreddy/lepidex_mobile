part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object> get props => [];
}

class AddImageFromCameraEvent extends ScanEvent {}

class AddImageFromGalleryEvent extends ScanEvent {}

class ImageDetailsEvent extends ScanEvent {}

class SaveImageEvent extends ScanEvent {}

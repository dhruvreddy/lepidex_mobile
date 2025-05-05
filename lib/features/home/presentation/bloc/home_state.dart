part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetDetailsInitial extends HomeState {}

class GetDetailsSuccessful extends HomeState {
  final List<ButterflyEntity> butterflyEntity;

  const GetDetailsSuccessful({
    required this.butterflyEntity,
  });
}

class GetDetailsError extends HomeState {
  final String error;

  const GetDetailsError({
    required this.error,
  });
}

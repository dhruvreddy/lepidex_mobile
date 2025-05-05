import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lepidex/features/home/domain/entities/butterfly_entity.dart';
import 'package:lepidex/features/home/domain/usecases/delete_details.dart';
import 'package:lepidex/features/home/domain/usecases/get_details.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDetails _getDetails;
  final DeleteDetails _deleteDetails;
  HomeBloc({
    required GetDetails getDetails,
    required DeleteDetails deleteDetails,
  })  : _getDetails = getDetails,
        _deleteDetails = deleteDetails,
        super(HomeInitial()) {
    on<GetDetailsEvent>(_getDetailsEvent);
    on<DeleteDetailsEvent>(_deleteDetailsEvent);
  }

  Future<void> _getDetailsEvent(GetDetailsEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        GetDetailsInitial(),
      );
      final List<ButterflyEntity> butterflyEntity = await _getDetails();
      emit(
        GetDetailsSuccessful(butterflyEntity: butterflyEntity),
      );
    } catch (e) {
      emit(
        GetDetailsError(error: e.toString()),
      );
      throw ("Error at _getDetailsEvent, error: $e");
    }
  }

  Future<void> _deleteDetailsEvent(DeleteDetailsEvent event, Emitter<HomeState> emit) async {
    try {
      await _deleteDetails();
    } catch (e) {
      throw ("Error at _getDetailsEvent, error: $e");
    }
  }
}

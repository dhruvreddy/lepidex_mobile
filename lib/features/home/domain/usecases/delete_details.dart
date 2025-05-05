import 'package:lepidex/features/home/domain/repositories/details_repository.dart';

final class DeleteDetails {
  final DetailsRepository _detailsRepository;

  DeleteDetails({
    required DetailsRepository detailsRepository,
  }) : _detailsRepository = detailsRepository;

  Future<void> call() async {
    try {
      await _detailsRepository.getDetails();
    } catch (e) {
      throw ("Error at DetailsRepository, error: $e");
    }
  }
}

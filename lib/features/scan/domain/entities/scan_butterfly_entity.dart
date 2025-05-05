import '../../data/models/scan_butterfly_model.dart';

final class ScanButterflyEntity {
  final String commonName;
  final String binomialName;
  final String domain;
  final String kingdom;
  final String phylum;
  final String className;
  final String order;
  final String family;
  final String genus;
  final String species;

  ScanButterflyEntity({
    required this.commonName,
    required this.binomialName,
    required this.domain,
    required this.kingdom,
    required this.phylum,
    required this.className,
    required this.order,
    required this.family,
    required this.genus,
    required this.species,
  });

  factory ScanButterflyEntity.fromModel(ScanButterflyModel model) {
    return ScanButterflyEntity(
      commonName: model.commonName,
      binomialName: model.binomialName,
      domain: model.domain,
      kingdom: model.kingdom,
      phylum: model.phylum,
      className: model.className,
      order: model.order,
      family: model.family,
      genus: model.genus,
      species: model.species,
    );
  }
}

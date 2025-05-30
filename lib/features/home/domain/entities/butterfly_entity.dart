import 'package:hive_flutter/hive_flutter.dart';
import 'package:lepidex/features/home/data/models/butterfly_model.dart';

part 'butterfly_entity.g.dart';

@HiveType(typeId: 3)
final class ButterflyEntity extends HiveObject {
  @HiveField(0)
  final String? path;

  @HiveField(1)
  final String commonName;

  @HiveField(2)
  final String binomialName;

  @HiveField(3)
  final String domain;

  @HiveField(4)
  final String kingdom;

  @HiveField(5)
  final String phylum;

  @HiveField(6)
  final String className;

  @HiveField(7)
  final String order;

  @HiveField(8)
  final String family;

  @HiveField(9)
  final String genus;

  @HiveField(10)
  final String species;

  ButterflyEntity({
    required this.path,
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

  factory ButterflyEntity.fromModel(ButterflyModel model) {
    return ButterflyEntity(
      path: model.path,
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

final class ScanButterflyModel {
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

  ScanButterflyModel({
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

  factory ScanButterflyModel.fromJson(Map<String, dynamic> json) {
    return ScanButterflyModel(
      commonName: json["butterfly"]['Common Name'] ?? '',
      binomialName: json["butterfly"]['Binomial Name'] ?? '',
      domain: json["butterfly"]['Domain'] ?? '',
      kingdom: json["butterfly"]['Kingdom'] ?? '',
      phylum: json["butterfly"]['Phylum'] ?? '',
      className: json["butterfly"]['Class'] ?? '',
      order: json["butterfly"]['Order'] ?? '',
      family: json["butterfly"]['Family'] ?? '',
      genus: json["butterfly"]['Genus'] ?? '',
      species: json["butterfly"]['Species'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Common Name': commonName,
      'Binomial Name': binomialName,
      'Domain': domain,
      'Kingdom': kingdom,
      'Phylum': phylum,
      'Class': className,
      'Order': order,
      'Family': family,
      'Genus': genus,
      'Species': species,
    };
  }
}

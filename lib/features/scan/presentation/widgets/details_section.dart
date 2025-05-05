import 'package:flutter/material.dart';
import 'package:lepidex/core/theme/app_pallete.dart';
import 'package:lepidex/features/scan/domain/entities/scan_butterfly_entity.dart';

class DetailsSection extends StatefulWidget {
  final ScanButterflyEntity scanButterflyEntity;

  const DetailsSection({
    super.key,
    required this.scanButterflyEntity,
  });

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection> {
  late final Map<String, String> details;

  @override
  void initState() {
    details = {
      "Common Name": widget.scanButterflyEntity.commonName,
      "Binomial Name": widget.scanButterflyEntity.binomialName,
      "Domain": widget.scanButterflyEntity.domain,
      "Kingdom": widget.scanButterflyEntity.kingdom,
      "Phylum": widget.scanButterflyEntity.phylum,
      "Class": widget.scanButterflyEntity.className,
      "Order": widget.scanButterflyEntity.order,
      "Family": widget.scanButterflyEntity.family,
      "Genus": widget.scanButterflyEntity.genus,
      "Species": widget.scanButterflyEntity.species,
    };
    print(details["Common Name"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 380,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppPallete.gradient3, // Set a background color to complement the text
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4), // Slight shadow below the box
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: details.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(fontSize: 30, color: AppPallete.whiteColor),
                    ),
                    Text(
                      entry.value,
                      style: TextStyle(fontSize: 20, color: AppPallete.gradient2),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

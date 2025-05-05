import 'package:flutter/material.dart';
import 'package:lepidex/features/home/presentation/widgets/butterfly_details_widget.dart';
import 'package:lepidex/features/home/presentation/widgets/details_container.dart';

class ButterflyDetails extends StatelessWidget {
  const ButterflyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lepidex"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              ButterflyDetailsWidget(),
              DetailsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

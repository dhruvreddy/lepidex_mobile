import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lepidex/core/theme/app_pallete.dart';
import 'package:lepidex/features/scan/presentation/bloc/scan_bloc.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppPallete.gradient1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                context.read<ScanBloc>().add(SaveImageEvent());
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 18, color: AppPallete.whiteColor),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<ScanBloc>().add(ImageDetailsEvent());
              },
              child: const Text(
                "Scan",
                style: TextStyle(fontSize: 18, color: AppPallete.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

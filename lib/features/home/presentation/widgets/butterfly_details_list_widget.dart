import 'package:flutter/material.dart';
import 'package:lepidex/core/theme/app_pallete.dart';
import 'package:lepidex/features/home/presentation/pages/butterfly_details.dart';

class ButterflyDetailsListWidget extends StatelessWidget {
  // final String imagePath;
  final String butterflyName;
  // final VoidCallback onDelete;

  const ButterflyDetailsListWidget({
    super.key,
    // required this.imagePath,
    required this.butterflyName,
    // required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppPallete.gradient2),
          borderRadius: BorderRadius.circular(10),
          color: AppPallete.gradient2.withOpacity(0.1), // adjust opacity as needed
        ),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  // backgroundImage: FileImage(File(imagePath)),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    butterflyName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_forever, color: Colors.red),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ButterflyDetails()),
            );
          },
        ),
      ),
    );
  }
}

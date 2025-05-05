import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lepidex/core/theme/app_pallete.dart';
import 'package:lepidex/features/home/domain/entities/butterfly_entity.dart';
import 'package:lepidex/features/home/presentation/bloc/home_bloc.dart';
import 'package:lepidex/features/scan/presentation/pages/image_scan_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeBloc>().add(GetDetailsEvent());
            return Center(child: CircularProgressIndicator());
          } else if (state is GetDetailsInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetDetailsSuccessful) {
            return ListView.builder(
              itemCount: state.butterflyEntity.length,
              itemBuilder: (context, index) {
                return ButterflyDetailsWidget(
                  imagePath: state.butterflyEntity[index].path ?? '',
                  butterflyName: state.butterflyEntity[index].commonName,
                  onDelete: () {
                    context.read<HomeBloc>().add(DeleteDetailsEvent());
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ButterflyDetailScreen(
                          butterflyEntity: state.butterflyEntity[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is GetDetailsError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImageScanPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ButterflyDetailsWidget extends StatelessWidget {
  final String imagePath;
  final String butterflyName;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const ButterflyDetailsWidget({
    super.key,
    required this.imagePath,
    required this.butterflyName,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppPallete.gradient2),
            borderRadius: BorderRadius.circular(10),
            color: AppPallete.gradient2.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: FileImage(File(imagePath)),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    butterflyName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete_forever, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButterflyDetailScreen extends StatelessWidget {
  final ButterflyEntity butterflyEntity;

  const ButterflyDetailScreen({super.key, required this.butterflyEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(butterflyEntity.commonName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(File(butterflyEntity.path ?? '')),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Common Name: ${butterflyEntity.commonName}', style: TextStyle(fontSize: 18)),
                  Text('Binomial Name: ${butterflyEntity.binomialName}', style: TextStyle(fontSize: 18)),
                  Text('Domain: ${butterflyEntity.domain}', style: TextStyle(fontSize: 18)),
                  Text('Kingdom: ${butterflyEntity.kingdom}', style: TextStyle(fontSize: 18)),
                  Text('Phylum: ${butterflyEntity.phylum}', style: TextStyle(fontSize: 18)),
                  Text('Class: ${butterflyEntity.className}', style: TextStyle(fontSize: 18)),
                  Text('Order: ${butterflyEntity.order}', style: TextStyle(fontSize: 18)),
                  Text('Family: ${butterflyEntity.family}', style: TextStyle(fontSize: 18)),
                  Text('Genus: ${butterflyEntity.genus}', style: TextStyle(fontSize: 18)),
                  Text('Species: ${butterflyEntity.species}', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

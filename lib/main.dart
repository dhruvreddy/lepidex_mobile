import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lepidex/core/theme/custom_theme.dart';
import 'package:lepidex/features/home/presentation/bloc/home_bloc.dart';
import 'package:lepidex/features/home/presentation/pages/butterfly_details.dart';
import 'package:lepidex/features/home/presentation/pages/home_page.dart';
import 'package:lepidex/features/scan/data/models/save_butterfly_model.dart';
import 'package:lepidex/features/scan/domain/entities/save_butterfly_entity.dart';
import 'package:lepidex/features/scan/presentation/bloc/scan_bloc.dart';
import 'package:lepidex/features/scan/presentation/pages/image_scan_page.dart';

import '/injection.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SaveButterflyModelAdapter());
  Hive.registerAdapter(SaveButterflyEntityAdapter());

  setup();
  // await injection.isReady<HiveInterface>();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injection<ScanBloc>()),
        BlocProvider(create: (context) => injection<HomeBloc>()),
      ],
      child: Lepidex(),
    ),
  );
}

class Lepidex extends StatelessWidget {
  const Lepidex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lepidex",
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkThemeMode,
      home: HomePage(),
    );
  }
}

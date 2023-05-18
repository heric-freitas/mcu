import 'package:flutter/material.dart';

import 'src/core/theme/app_theme.dart';
import 'src/modules/mcu/mcu_provider.dart';
import 'src/modules/movie_detail/movie_detail_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (_) => const McuProvider(),
        '/details': (context) {
          final id = ModalRoute.of(context)!.settings.arguments as int;
          return MovieDetailProvider(id: id);
        },
      },
    );
  }
}

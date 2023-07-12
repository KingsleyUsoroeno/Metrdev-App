import 'package:flutter/material.dart';
import 'package:metrdev_app/di/injection.dart';
import 'package:metrdev_app/routing/routes.dart';
import 'package:metrdev_app/util/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metrdev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.backgroundColor),
          useMaterial3: true,
          fontFamily: "Mont",
          scaffoldBackgroundColor: AppColors.backgroundColor),
      routes: routes,
      initialRoute: loginRoute,
    );
  }
}

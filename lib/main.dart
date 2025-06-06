import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_animation/core/routes/routes.dart';
import 'package:todo_animation/core/routes/routes.name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: !kReleaseMode,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutesName.home,
    );
  }
}

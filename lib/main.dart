import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/app_router.dart';
import 'package:properties/resource/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //initialize sl
  await initSl();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Property place',
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: goRouter,
    );
  }
}

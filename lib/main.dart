import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quick_medical/screens/cart.dart';
import 'package:quick_medical/firebase_options.dart';
import 'package:quick_medical/screens/splash-screen.dart';
import 'package:quick_medical/screens/walk-through.dart';
import 'package:quick_medical/widgets/btm-navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenView(),
    );
  }
}

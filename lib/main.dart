import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Hands-On AI',
    home: Homescreen(),
  ));
}

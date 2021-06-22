import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator/calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]); // Seta a orientação do dispositivo para o modo retrato
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Apaga a tag 'debug' do canto superior direito
      home: Calculator(),
    );
  }
}

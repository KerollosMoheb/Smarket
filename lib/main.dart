import 'package:flutter/material.dart';
import 'package:fruit_market/views/splash_page.dart';

void main() {
  runApp(const Sfruit());
}

class Sfruit extends StatelessWidget {
  const Sfruit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Market',
      home: SplashPage(),
    );
  }
}

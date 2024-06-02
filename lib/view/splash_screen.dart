import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final services = SplashServices();
  @override
  void initState() {
    super.initState();

    services.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("MVVM Model", style: Theme.of(context).textTheme.headlineMedium)],
      )),
    );
  }
}

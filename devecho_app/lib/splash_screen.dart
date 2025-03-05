import 'package:devecho_app/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/splash_animation.json', width: 200),
          Text(
            'Welcome!',
            style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
      nextScreen: const AuthGate(),
      splashIconSize: 250,
      backgroundColor: Theme.of(context).colorScheme.surface,
      duration: 1500,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
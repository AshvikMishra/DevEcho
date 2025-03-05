import 'package:confetti/confetti.dart';
import 'package:devecho_app/services/auth/auth_service.dart';
import 'package:devecho_app/components/my_button.dart';
import 'package:devecho_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _confirmpwdController = TextEditingController();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void register(BuildContext context) {
    final auth = AuthService();

    if (_pwdController.text == _confirmpwdController.text) {
      try {
        auth.signUpWithEmailPassword(_emailController.text, _pwdController.text);
        _confettiController.play();
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!", style: TextStyle(fontSize: 16)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color confettiColor1 = Theme.of(context).colorScheme.primary;
    Color confettiColor2 = Theme.of(context).colorScheme.secondary;
    Color confettiColor3 = Theme.of(context).colorScheme.tertiary;
    Color confettiColor4 = Theme.of(context).colorScheme.inversePrimary;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Pixel.message,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 50),
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextfield(
                  hintText: "Email",
                  obscureText: false,
                  controller: _emailController,
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  hintText: "Password",
                  obscureText: true,
                  controller: _pwdController,
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: _confirmpwdController,
                ),
                const SizedBox(height: 25),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    MyButton(
                      text: "Register",
                      onTap: () => register(context),
                    ),
                    Positioned(
                      child: ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirectionality: BlastDirectionality.explosive,
                        emissionFrequency: 0,
                        numberOfParticles: 20,
                        gravity: 0.3,
                        colors: [confettiColor1, confettiColor2, confettiColor3, confettiColor4],
                        particleDrag: 0.05,
                        minimumSize: const Size(3, 3),
                        maximumSize: const Size(7, 7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
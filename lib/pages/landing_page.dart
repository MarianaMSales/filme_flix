import 'package:filme_flix_app/components/primary_button.dart';
import 'package:filme_flix_app/components/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/the_last_jedi.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: size.height * .33,
            width: size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 29,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Watch movies anytime anywhere",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "Explore a vast collection of blockbuster movies, timeless classics, and the latest releases.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PrimaryButton(
                  onPressed: () => context.go('/login'),
                  text: "Login",
                ),
                SecondaryButton(
                  onPressed: () => context.go('/signup'),
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:docs_clone/Auth/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:docs_clone/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void signInWithGoogle(WidgetRef ref) {
    ref.read(AuthRepoProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => signInWithGoogle(ref),
          icon: Image.asset(
            'assets/images/g-logo.png',
            height: 20,
          ),
          label: const Text(
            'Sign in with Google',
            style: TextStyle(
              color: blackColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: whiteColor,
            minimumSize: const Size(150, 50),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_todo/src/view/home.dart';
import 'package:flutter_get_todo/src/view/sign_in.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const SignInView();
        } else {
          return const HomeView();
        }
      },
    );
  }
}

import 'package:kudos/entry_phase_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/loginPages/firebase_auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<FirebaseAuthService>(
        create: (context) => FirebaseAuthService(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: entry_phase_1(),
        )
    );
  }
}



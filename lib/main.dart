import 'package:bot_toast/bot_toast.dart';
import 'package:dijkstra/dijkstra.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rejsekort/calc/zone_data.dart';
import 'package:rejsekort/screens/auth_screen.dart';
import 'package:rejsekort/widgets/introduction/introduction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../calc/zone_calculator.dart';
import 'screens/navigationbar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // print(zoneData(8, 4));
  // print(calculatePrice(zoneData(8, 4), 21));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rejsekort',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: BotToastInit(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => StreamBuilder(
              builder: (ctx, userSnapshot) {
                if (userSnapshot.hasData) {
                  return const NavigationScreen();
                }
                return Introduction();
              },
              stream: FirebaseAuth.instance.authStateChanges(),
            ),
        Introduction.routeName: (ctx) => Introduction(),
        AuthScreen.routeName: (ctx) => StreamBuilder(
              builder: (ctx, userSnapshot) {
                if (userSnapshot.hasData) {
                  return const NavigationScreen();
                }
                return AuthScreen();
              },
              stream: FirebaseAuth.instance.authStateChanges(),
            ),
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rejsekort/screens/auth_screen.dart';
import '../calc/zone_calculator.dart';
import 'screens/navigationbar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Intializer locale formating
  // Fjerner landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
  // var getZone = zoneData('Høje Taastrup', 'Greve');
  // var calcPrice = calculatePrice(getZone, 14);
  // print('$calcPrice kr.');
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
      initialRoute: '/',
      routes: {
        '/': (ctx) => StreamBuilder(
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

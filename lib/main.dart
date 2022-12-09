import 'package:flutter/material.dart';

import '../calc/zone_calculator.dart';
import 'screens/navigationbar_screen.dart';

void main() {
  // Fjerner landscape mode
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );
  // initializeDateFormatting('da_DK', null).then((_) => runApp(const MyApp()));
  zoneData('Høje Taastrup', 'Hedehusene');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (ctx) => NavigationScreen(),
      },
    );
  }
}

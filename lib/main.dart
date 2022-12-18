import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im_animations/main.dart';
import 'package:rejsekort/screens/home_screen.dart';
import 'package:rejsekort/loginpage/Homepage.dart';
import '../calc/zone_calculator.dart';
import 'screens/navigationbar_screen.dart';

void main() {
  // Intializer locale formating
  // initializeDateFormatting('da_DK', null);
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
        '/': (ctx) => const LoginScreen(),
      },
    );
  }
}

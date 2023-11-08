import 'package:devathone/Screens/Doctor/dashboard/dashboard.dart';
import 'package:devathone/Screens/Login/login_screen.dart';
import 'package:devathone/Screens/Patient/patient_bookanappointment.dart';
import 'package:devathone/Screens/Patient/patient_dashboard.dart';
import 'package:devathone/Screens/Patient/PatientHome/patient_home.dart';
import 'package:devathone/Screens/Register/register_screen.dart';
import 'package:devathone/Screens/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Devathon App',
        initialRoute: '/patientDashboard',
        routes: {
          '/splash': (BuildContext context) => const Splash(),
          '/login': (BuildContext context) => const LoginScreen(),
          '/register': (BuildContext context) => const RegisterScreen(),
          '/patientDashboard': (BuildContext context) =>
              const PateintDashboard(),
          '/doctorDashboard': (BuildContext context) => const DoctorDashboard(),
          '/patienthome': (BuildContext context) => const PatientHome(),
          '/drInfo': (BuildContext context) => const DrInfo(),
        },
        debugShowCheckedModeBanner: false,
        home: const PateintDashboard());
  }
}

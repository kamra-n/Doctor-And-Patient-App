import 'package:devathone/Screens/Patient/patient_bookings.dart';
import 'package:devathone/Screens/Patient/PatientHome/patient_home.dart';
import 'package:devathone/constants/app_constants.dart';
import 'package:flutter/material.dart';

class PateintDashboard extends StatefulWidget {
  const PateintDashboard({super.key});

  @override
  State<PateintDashboard> createState() => _PateintDashboardState();
}

class _PateintDashboardState extends State<PateintDashboard> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const PatientHome(),
    const PatientBooking(),
    const PatientBooking(),
    const PatientBooking(),

    // const DrInfo()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Appcolors.baseColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: 'Favorites',
              backgroundColor: Appcolors.baseColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.image_search_sharp),
              label: 'Doctors',
              backgroundColor: Appcolors.baseColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.supervised_user_circle),
              label: 'Profile',
              backgroundColor: Appcolors.baseColor),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Appcolors.baseColor,
        onTap: onItemTapped,
      ),
    );
  }
}

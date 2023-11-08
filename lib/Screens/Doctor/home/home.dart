import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    bool isSigningOut = false;
    bool isLoggedIn = false;

    // Future<void> deleteItem(itemToDelete) async {
    //   for (var item in itemToDelete['imagesName']) {
    //     final imgToDelete =
    //         FirebaseStorage.instance.ref().child("itemPics/$item");
    //     await imgToDelete.delete();
    //   }
    //   await FirebaseFirestore.instance
    //       .collection('all_items')
    //       .doc(itemToDelete.id)
    //       .delete()
    //       .then((value) => showDialog(
    //           context: context,
    //           builder: (context) {
    //             return const MyCustomDialouge(
    //                 alertTitle: 'Item has been deleted successfully',
    //                 alertIcon: Icon(Icons.delete_forever, color: Colors.red));
    //           }));
    // }

    signUserOut() async {
      isSigningOut = true;
      setState(() {});
      await FirebaseAuth.instance.signOut();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', isLoggedIn);
      await prefs.setBool('isAdmin', false);
      setState(() {});
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login');
    }

    return SafeArea(
        child: Scaffold(
            body: isSigningOut
                ? const CircularProgressIndicator()
                : const Column(children: [
                    Text('This is doctor homepage'),
                  ])));
  }
}

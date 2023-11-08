import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devathone/Screens/Patient/PatientHome/patient_home_widgets/patient_home_category_card.dart';
import 'package:devathone/Screens/Patient/patient_bookanappointment.dart';
import 'package:devathone/constants/app_images_constant.dart';
import 'package:devathone/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({super.key});

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

TextEditingController _searchController = TextEditingController();

@override
void initState() {}

class _PatientHomeState extends State<PatientHome> {
  CollectionReference alldocs =
      FirebaseFirestore.instance.collection('alldoctors');

  // String? id;
  bool isUpdated = false;
  // Future<void> getValuesFromStorage() async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     id = prefs.getString('uid')!;
  //   } catch (e) {
  //     print('error in catch $e');
  //   }
  // }

  //  List<Map><String, dynamic> alldocter = [];
  @override
  Widget build(BuildContext context) {
    print('data from list $alldocs');
    return Scaffold(
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffb28cfe),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color(0XFF000000),
                      )),
                  hintText: 'Search Doctor By name?',
                  labelText: 'Search Doctor By name?',
                  labelStyle: const TextStyle(color: Color(0XFF000000)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PatienthomeCategorycard(
                  categoryName: 'Cardiology',
                  categoryImage: AppImages.cardiologyIcon),
              PatienthomeCategorycard(
                  categoryName: 'Medicine',
                  categoryImage: AppImages.medicineIcon),
              PatienthomeCategorycard(
                  categoryName: 'General',
                  categoryImage: AppImages.generalIcon),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: alldocs.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                for (var document in documents) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  print('data $data');
                  alldocter?.addAll(data);
                  // Use 'data' to access the fields in the document.
                }
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = snapshot.data!.docs[index];
                  return DoctorCard(
                    image: document['profile'],
                    name: document['doctorname'],
                    subTitle: document['docsubtitle'],
                    appointment: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DrInfo(
                                image: document['profile'],
                                name: document['doctorname'],
                                subTitle: document['docsubtitle'],
                              )));
                    },
                  );
                },
              );
            },
          ),
        )
      ])),
    );
  }
}

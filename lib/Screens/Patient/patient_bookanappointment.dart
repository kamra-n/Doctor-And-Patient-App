import 'package:devathone/constants/app_constants.dart';
import 'package:devathone/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DrInfo extends StatefulWidget {
  final String? image;
  final String? name;
  final String? subTitle;
  const DrInfo({
    super.key,
    this.image,
    this.name,
    this.subTitle,
  });

  @override
  State<DrInfo> createState() => _DrInfoState();
}

class _DrInfoState extends State<DrInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.network('${widget.image}'),
                    Text('${widget.name}'),
                    Text('${widget.subTitle}'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.baseColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Appcolors.secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(children: [
                        Text(
                          "350+",
                          style: TextStyle(
                              color: Appcolors.baseColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Patients",
                            style: TextStyle(color: Appcolors.baseColor)),
                      ]),
                    ),
                    Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Appcolors.baseColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(children: [
                        const Text(
                          "15+",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Exp. years",
                            style: TextStyle(color: Appcolors.baseColor)),
                      ]),
                    ),
                    Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Appcolors.baseColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(children: [
                        const Text(
                          "284+",
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Reviews",
                            style: TextStyle(color: Appcolors.baseColor)),
                      ]),
                    ),
                  ],
                ),
              ),
              const Text(
                "About Doctor",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('${widget.subTitle}'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Schedules",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("7"),
                          Text("sun"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("8"),
                          Text("mon"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("9"),
                          Text("tue"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("10"),
                          Text("wed"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("11"),
                          Text("thu"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("12"),
                          Text("fri"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("13"),
                          Text("sat"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("14"),
                          Text("sun"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonTextColor: Colors.white,
                buttonColor: Appcolors.baseColor,
                buttonName: 'Book Appointment',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

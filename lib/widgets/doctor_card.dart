import 'package:devathone/constants/app_constants.dart';
import 'package:devathone/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorCard extends StatefulWidget {
  final String image;
  final String name;
  final String subTitle;
  final void Function()? appointment;
  // final void
  const DoctorCard(
      {super.key,
      required this.image,
      required this.name,
      required this.subTitle,
      this.appointment});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 10),
        height: 110,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Appcolors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: Stack(children: [
                      Positioned(
                        top: 0,
                        right: 3,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: const Color(0XFF8ef4bc),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      ClipOval(
                        child: Image.network(
                          widget.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: 0.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color(0XFF8ef4bc),
                        ),
                        onRatingUpdate: (rating) {
                          print('rating $rating');
                        },
                      ),
                      const Text(
                        '4.8',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.subTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0XFF7d8bb7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      width: 120,
                      height: 40,
                      child: CustomButton(
                        buttonTextColor: Colors.black,
                        buttonName: 'Appointment',
                        onPressed: widget.appointment,
                        buttonColor: const Color(0XFFf7f8f8),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

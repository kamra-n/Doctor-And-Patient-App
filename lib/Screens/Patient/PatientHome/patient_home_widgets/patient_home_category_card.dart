import 'package:devathone/constants/app_constants.dart';
import 'package:flutter/material.dart';

class PatienthomeCategorycard extends StatefulWidget {
  final String categoryName;
  final String categoryImage;
  const PatienthomeCategorycard(
      {super.key, required this.categoryName, required this.categoryImage});

  @override
  State<PatienthomeCategorycard> createState() =>
      _PatienthomeCategorycardState();
}

class _PatienthomeCategorycardState extends State<PatienthomeCategorycard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 80,
      width: 90,
      decoration: BoxDecoration(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            widget.categoryImage,
            height: 40,
            width: 40,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.categoryName,
            style: TextStyle(color: Appcolors.baseColor),
          )
        ],
      ),
    );
  }
}

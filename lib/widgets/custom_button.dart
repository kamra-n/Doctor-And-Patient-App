import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      this.onPressed,
      required this.buttonColor,
      required this.buttonTextColor});

  final String buttonName;
  final void Function()? onPressed;
  final Color buttonColor;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            backgroundColor: buttonColor,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: TextStyle(color: buttonTextColor),
          )),
    );
  }
}

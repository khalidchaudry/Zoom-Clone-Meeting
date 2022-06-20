import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class ReusableIconButtonWidget extends StatelessWidget {
  const ReusableIconButtonWidget(
      {Key? key,
      required this.iconData,
      required this.press,
      required this.text})
      : super(key: key);
  final IconData iconData;
  final Function() press;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: kButtonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.7))
              ]),
          child: IconButton(
              onPressed: press,
              icon: Icon(
                iconData,
                size: 30,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        )
      ],
    );
  }
}

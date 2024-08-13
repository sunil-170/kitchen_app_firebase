import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';

///Helpers
var data = alldataManager;

// ignore: must_be_immutable
class Profiletile extends StatelessWidget {
  String image, name;

  Function onPressed;
  Profiletile(
      {super.key,
      required this.image,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            onPressed();
          },
          leading: Image.asset(
            image,
            fit: BoxFit.cover,
            width: 20,
          ),
          title: Text(
            name,
            style: data.gettexttheme.fs16_regular,
          ),
          trailing: Icon(Icons.keyboard_arrow_right_rounded,
              size: 22, color: data.getcolor.primaryColor),
        ),
      ],
    );
  }
}

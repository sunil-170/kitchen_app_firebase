import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';

///Helpers
var data = alldataManager;

class Profiletile extends StatelessWidget {
  final String image, name;
  final Function onPressed;

  Profiletile({
    Key? key,
    required this.image,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/main.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatefulWidget {
  String title;
  Color? backgroundColor, foregroundColor;
  Color? borderColor;
  final bool isExpanded;
  Function onPressed;
  PrimaryButton(
      {super.key,
      this.borderColor,
      required this.title,
      this.backgroundColor,
      this.foregroundColor,
      this.isExpanded = false,
      required this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  ///Helpers
  var data = alldataManager;

  @override
  Widget build(BuildContext context) {
    final txtbtn = TextButton(
      child: Text(
        widget.title,
        style: data.gettexttheme.fs16_regular,
      ),
      onPressed: () {
        widget.onPressed();
      },
      style: TextButton.styleFrom(
        foregroundColor: widget.foregroundColor,
        backgroundColor: widget.backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        side: widget.borderColor != null
            ? BorderSide(color: widget.borderColor!, width: 1)
            : null,
      ),
    );
    return widget.isExpanded ? Expanded(child: txtbtn) : txtbtn;
  }
}

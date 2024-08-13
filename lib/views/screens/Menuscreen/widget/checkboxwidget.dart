import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';

// ignore: must_be_immutable
class CheckboxWidget extends StatefulWidget {
  CheckboxWidget(
      {super.key,
      required this.text,
      required this.onSelect,
      required this.selected_text,
      required this.checkcolor,
      required this.style});
  String text;
  String selected_text;
  Function(String) onSelect;
  Color checkcolor;
  TextStyle style;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

final font = alldataManager;

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            splashRadius: 0.0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: widget.checkcolor,
            value: widget.selected_text == widget.text,
            onChanged: (newvalue) => widget.onSelect(widget.text)),
        AppServices.addWidth(10.w),
        Text(
          widget.text,
          style: widget.style.copyWith(
              color: widget.selected_text == widget.text
                  ? alldataManager.getcolor.primaryColor
                  : alldataManager.getcolor.black),
        ),
      ],
    );

    // CheckboxListTile(
    //   contentPadding: EdgeInsetsDirectional.zero,
    //   title: Text(
    //     widget.text,
    //     style: widget.style.copyWith(
    //         color: widget.selected_text == widget.text
    //             ? alldataManager.getcolor.primaryColor
    //             : alldataManager.getcolor.black),
    //   ),
    //   value: widget.selected_text == widget.text,
    //   activeColor: widget.checkcolor,
    //   onChanged: (newValue) => widget.onSelect(widget.text),
    //   controlAffinity: ListTileControlAffinity.leading,
    // );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/Validator/validator.dart';
import 'package:kitchen_app/res/utils/primary_decorations.dart';

class PrimaryTextField extends StatefulWidget {
  TextEditingController? controller;
  IconData? icon;
  String? imageicon;
  Icon? icons;
  Function? onSufixPressed;
  bool isExpanded;
  String? hintText;
  FormValidator? validator;
  bool obsecure;
  Color? fillcolor;
  Function(String?)? onchange;
  TextStyle? style;
  TextInputType? keyboardType;
  int? maxlength;
  int? maxLines;
  String title;

  PrimaryTextField(
      {super.key,
      this.icon,
      this.imageicon,
      this.isExpanded = false,
      this.onSufixPressed,
      this.obsecure = false,
      this.controller,
      this.hintText,
      this.onchange,
      this.validator,
      this.style,
      this.fillcolor,
      this.keyboardType,
      this.maxlength,
      this.maxLines,
      required this.title});

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  ///Helpers
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    final textfield = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: data.gettexttheme.fs12_regular
                .copyWith(color: data.getcolor.gray.withOpacity(0.5))),
        AppServices.addHeight(5),
        TextFormField(
            maxLines: widget.maxLines != null ? widget.maxLines : 1,
            maxLength: widget.maxlength,
            keyboardType: widget.keyboardType,
            style: data.gettexttheme.fs14_regular,
            controller: widget.controller,
            obscureText: widget.obsecure,
            onChanged: widget.onchange,
            validator: widget.validator == null
                ? null
                : (value) => widget.validator!.validate(value),
            decoration: PrimaryDecorations.primaryTextFieldDecoration.copyWith(
              contentPadding: EdgeInsets.all(10),
              hintText: widget.hintText,
              hintStyle: widget.style,
              suffixIcon: IconButton(
                  color: data.getcolor.gray,
                  onPressed: widget.onSufixPressed != null
                      ? () => widget.onSufixPressed!()
                      : null,
                  icon: Icon(
                    widget.icon,
                    color: data.getcolor.gray,
                  )),
            )),
      ],
    );
    return widget.isExpanded ? Expanded(child: textfield) : textfield;
  }
}

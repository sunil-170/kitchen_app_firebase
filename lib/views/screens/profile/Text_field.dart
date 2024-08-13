// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/Validator/validator.dart';
import 'package:kitchen_app/res/utils/primary_decorations.dart';

class PrimaryTextFieil_sufixtext extends StatefulWidget {
  TextEditingController? controller;
  IconData? icon;
  String? imageicon;
  Icon? icons;
  Function? onSufixPressed;
  bool isExpanded;

  String? hintText;
  String fieldtxt;
  FormValidator? validator;
  bool obsecure;
  Color? fillcolor;
  Function(String?)? onchange;
  TextStyle? style;
  TextInputType? keyboardType;
  int? maxlength;
  int? maxLines;
  String? sufixtxt;

  PrimaryTextFieil_sufixtext({
    super.key,
    this.icon,
    this.imageicon,
    this.isExpanded = false,
    this.onSufixPressed,
    this.obsecure = false,
    this.controller,
    this.hintText,
    this.onchange,
    required this.fieldtxt,
    this.validator,
    this.style,
    this.fillcolor,
    this.keyboardType,
    this.maxlength,
    this.sufixtxt,
    this.maxLines,
  });

  @override
  State<PrimaryTextFieil_sufixtext> createState() =>
      _PrimaryTextFieil_sufixtextState();
}

class _PrimaryTextFieil_sufixtextState
    extends State<PrimaryTextFieil_sufixtext> {
  /// Helpers
  var data = alldataManager;

  @override
  Widget build(BuildContext context) {
    final textfield = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldtxt,
          style: data.gettexttheme.fs12_regular
              .copyWith(color: data.getcolor.gray),
        ),
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
            contentPadding: EdgeInsets.all(10).copyWith(
                top: widget.sufixtxt == null ? 14 : null,
                bottom: widget.sufixtxt == null ? 14 : null),
            hintText: widget.hintText,
            hintStyle: widget.style,
            suffixIcon: widget.sufixtxt != null && widget.sufixtxt!.isNotEmpty
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          width: 2,
                          color: data.getcolor.primaryColor,
                        ),
                      ),
                      IconButton(
                        color: data.getcolor.gray,
                        onPressed: widget.onSufixPressed != null
                            ? () => widget.onSufixPressed!()
                            : null,
                        icon: Text(
                          widget.sufixtxt!,
                          style: data.gettexttheme.fs16_regular
                              .copyWith(color: data.getcolor.primaryColor),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
        ),
      ],
    );

    return widget.isExpanded ? Expanded(child: textfield) : textfield;
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitchen_app/main.dart';

class PrimaryAppBar extends AppBar {
  final String titleText;
  final bool autoImplyLeading;
  PrimaryAppBar(
      {required this.titleText,
      super.centerTitle,
      super.actions,
      this.autoImplyLeading = true})
      : super(
            title: Padding(
              padding: autoImplyLeading == false
                  ? const EdgeInsets.symmetric(horizontal: 15)
                  : EdgeInsets.zero,
              child: Text(titleText,
                  style: alldataManager.gettexttheme.fs16_regular),
            ),
            automaticallyImplyLeading: autoImplyLeading);

  @override
  bool forceMaterialTransparency = true;

  @override
  SystemUiOverlayStyle? systemOverlayStyle = SystemUiOverlayStyle.dark;
}

import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';

/// *******  Common Text Filled        *********** ///
// ignore: must_be_immutable
class CommonTextformfilled extends StatefulWidget {
  String text;
  IconData? icon;
  Function? onpressed;
  bool obscuretext;
  bool readOnly;

  TextEditingController? controller;
  Function(String?)? validator;

  CommonTextformfilled({
    super.key,
    required this.text,
    this.icon,
    this.onpressed,
    this.obscuretext = false,
    this.readOnly = false,
    this.controller,
    this.validator,
  });

  @override
  State<CommonTextformfilled> createState() => _CommonTextformfilledState();
}

final data = alldataManager;

class _CommonTextformfilledState extends State<CommonTextformfilled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: data.getcolor.black20.withOpacity(0.1),
        ),
      ]),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscuretext,
        readOnly: widget.readOnly,
        style:
            data.gettexttheme.fs14_regular.copyWith(color: data.getcolor.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.text,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed:
                    widget.onpressed != null ? () => widget.onpressed!() : null,
                icon: Icon(
                  widget.icon,
                  color: data.getcolor.primaryColor,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: data.getcolor.primaryColor,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic,
                    color: data.getcolor.primaryColor,
                    size: 30,
                  )),
              AppServices.addWidth(10)
            ],
          ),
        ),
      ),
    );
  }
}

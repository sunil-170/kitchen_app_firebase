import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';

// ignore: must_be_immutable
class SwitchAdaptivetile extends StatefulWidget {
  String title;

  bool value;
  final ValueChanged<bool> onChanged;

  SwitchAdaptivetile({
    super.key,
    required this.onChanged,
    required this.title,
    required this.value,
  });

  @override
  State<SwitchAdaptivetile> createState() => _SecurityTileState();
}

class _SecurityTileState extends State<SwitchAdaptivetile> {
  @override
  Widget build(BuildContext context) {
    ///Helpers
    var data = alldataManager;
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.title, style: data.gettexttheme.fs16_regular),
          Switch.adaptive(
              splashRadius: 10,
              inactiveThumbColor: data.getcolor.white,
              activeColor: data.getcolor.white,
              activeTrackColor: data.getcolor.primaryColor,
              inactiveTrackColor: data.getcolor.black20,
              value: widget.value,
              onChanged: widget.onChanged)
        ]),
      ],
    );
  }
}

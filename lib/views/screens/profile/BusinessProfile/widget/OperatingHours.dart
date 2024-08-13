import 'package:flutter/material.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class OperatingHours extends StatelessWidget {
  const OperatingHours({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        child: Row(
      children: [
        PrimaryTextField(
          title: "Day",
          hintText: "India",
          isExpanded: true,
        ),
        AppServices.addWidth(11),
        PrimaryTextField(
          title: "From:",
          hintText: "Haryana",
          isExpanded: true,
        ),
        AppServices.addWidth(11),
        PrimaryTextField(
          title: "To:",
          hintText: "Haryana",
          isExpanded: true,
        ),
      ],
    ));
  }
}

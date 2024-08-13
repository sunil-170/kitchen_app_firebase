import 'package:flutter/material.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Addresswidget extends StatelessWidget {
  const Addresswidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(children: [
        PrimaryTextField(
          title: "Street",
          hintText: "Tiffin Service",
        ),
        AppServices.addHeight(10),
        Row(
          children: [
            PrimaryTextField(
              title: "Country",
              hintText: "India",
              isExpanded: true,
            ),
            AppServices.addWidth(10),
            PrimaryTextField(
              title: "State",
              hintText: "Haryana",
              isExpanded: true,
            ),
          ],
        ),
        AppServices.addHeight(10),
        Row(
          children: [
            PrimaryTextField(
              title: "City",
              hintText: "Hisar",
              isExpanded: true,
            ),
            AppServices.addWidth(10),
            PrimaryTextField(
              title: "Postal Code",
              hintText: "125001",
              isExpanded: true,
            ),
          ],
        ),
        AppServices.addHeight(10),
        Row(
          children: [
            PrimaryTextField(
              title: "Latitude",
              hintText: "23.222",
              isExpanded: true,
            ),
            AppServices.addWidth(10),
            PrimaryTextField(
              title: "Longitude",
              hintText: "25.588",
              isExpanded: true,
            ),
          ],
        ),
      ]),
    );
  }
}

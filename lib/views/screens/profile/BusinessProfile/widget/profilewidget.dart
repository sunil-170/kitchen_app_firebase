import 'package:flutter/material.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        child: Column(
      children: [
        PrimaryTextField(hintText: "Tiffin Service", title: "Kitchen Name"),
        AppServices.addHeight(10),
        PrimaryTextField(hintText: "example@.com", title: "E-Mail Address"),
        AppServices.addHeight(10),
        PrimaryTextField(hintText: "+919812673370", title: "Phone No"),
      ],
    ));
  }
}

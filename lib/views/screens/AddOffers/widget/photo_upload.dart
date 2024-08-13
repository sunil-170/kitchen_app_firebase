import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Photo_upload extends StatelessWidget {
   Photo_upload({
    super.key,
    
  });

  final style = alldataManager;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      border: true,
      isExpanded: true,
      child: Column(
        children: [
          Icon(
            Icons.file_download_outlined,
            size: 50,
          ),
          AppServices.addHeight(10),
          Text(
            LanguageConsts.dragYPHO.tr,
            style: style.gettexttheme.fs14_regular,
          ),
          Text(
            LanguageConsts.BrowseFD.tr,
            style: style.gettexttheme.fs14_regular
                .copyWith(color: style.getcolor.primaryColor),
          ),
        ],
      ),
    );
  }
}

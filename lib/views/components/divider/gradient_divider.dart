import 'package:flutter/material.dart';

import '../../../res/config/App_services/app_services.dart';
import '../../../singleton/Alldatamanager.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider(
      {super.key, required this.data, this.middleGradient = false});

  final AllDataManager data;
  final bool middleGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: AppServices.getScreenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        if (middleGradient) data.getcolor.gray.withOpacity(0.05),
        data.getcolor.black40,
        data.getcolor.gray.withOpacity(0.05)
      ])),
    );
  }
}

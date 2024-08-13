import 'package:flutter/material.dart';
import 'package:kitchen_app/main.dart';

class Dviders extends StatelessWidget {
  const Dviders({super.key});

  @override
  Widget build(BuildContext context) {
    ///Helpers
    var data = alldataManager;
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            data.getcolor.black20
                .withOpacity(0.1), // Left side with less opacity
            data.getcolor.gray.withOpacity(0.5), // Center fully opaque
            data.getcolor.black20
                .withOpacity(0.1), // Right side with less opacity
          ],
          stops: [0.0, 0.5, 1.0], // Stops for gradient transitions
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

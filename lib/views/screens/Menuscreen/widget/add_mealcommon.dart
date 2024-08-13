import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/singleton/Alldatamanager.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Mealcommonwidget extends StatelessWidget {
  const Mealcommonwidget({
    super.key,
    required this.data,
  });

  final AllDataManager data;

  @override
  Widget build(BuildContext context) {
    return
     PrimaryContainer(
      verticalPadding: 0,
      horizontalPadding: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Image.asset(data.getimg.meal_img)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "North Indian Meal",
                      style: data.gettexttheme.fs20_bold,
                    ),
                  ],
                ),
                AppServices.addHeight(5),
                Text(
                  "Soy,  Rice, Bell paper, Penuts",
                  style: data.gettexttheme.fs14_regular
                      .copyWith(color: data.getcolor.gray),
                ),
                AppServices.addHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          color: data.getcolor.primaryColor,
                        ),
                        AppServices.addWidth(10),
                        Text(
                          "90%",
                          style: data.gettexttheme.fs12_regular
                              .copyWith(color: data.getcolor.primaryColor),
                        ),
                        SizedBox(
                          height: 25,
                          child: VerticalDivider(
                            color: data.getcolor.primaryColor,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: data.getcolor.primaryColor,
                        ),
                        AppServices.addWidth(5),
                        Text("8.9",
                            style: data.gettexttheme.fs12_regular
                                .copyWith(color: data.getcolor.primaryColor)),
                      ],
                    ),
                    Text("\u{20B9}120/-",
                        style: data.gettexttheme.fs20_bold
                            .copyWith(color: data.getcolor.primaryColor))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

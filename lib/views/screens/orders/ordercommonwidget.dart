import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/singleton/Alldatamanager.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/screens/search/widget/common_txtfilled.dart';

import '../../components/widgets/primary_container.dart';

/// *******  Order Common Widget Tile  *********** ///
class Ordercommonwidget extends StatefulWidget {
  const Ordercommonwidget({
    super.key,
    required this.data,
  });

  final AllDataManager data;

  @override
  State<Ordercommonwidget> createState() => _OrdercommonwidgetState();
}

var initial_value = "";

class _OrdercommonwidgetState extends State<Ordercommonwidget> {
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      horizontalPadding: 0,
      verticalPadding: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Image.asset(
                widget.data.getimg.order_img,
                fit: BoxFit.cover,
                width: AppServices.getScreenWidth,
              )),
          AppServices.addHeight(10),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "North Indian Meal",
                      style: widget.data.gettexttheme.fs20_bold,
                    ),
                    Text("\u{20B9}140 /-",
                        style: widget.data.gettexttheme.fs20_bold
                            .copyWith(color: widget.data.getcolor.primaryColor))
                  ],
                ),
                AppServices.addHeight(2),
                Text(
                  "Order ID: 022222",
                  style: data.gettexttheme.fs14_regular,
                ),
                AppServices.addHeight(10),
                GradientDivider(
                  data: data,
                  middleGradient: true,
                ),
                AppServices.addHeight(10),
                Text(
                  "Soy,  Rice, Bell paper, Penuts",
                  style: data.gettexttheme.fs14_regular
                      .copyWith(color: data.getcolor.gray),
                ),
                AppServices.addHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                    ),
                    AppServices.addWidth(10),
                    Expanded(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text:
                                "Hotel The Icon, Talaki Gate, Rishi Nagar, Near bus stand, Hisar",
                            style: data.gettexttheme.fs16_regular
                                .copyWith(color: data.getcolor.gray)),
                        TextSpan(
                            text: " - 4 KM away",
                            style: data.gettexttheme.fs16_regular
                                .copyWith(color: data.getcolor.primaryColor))
                      ])),
                    ),
                  ],
                ),
                AppServices.addHeight(10),
                Row(
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      size: 20.w,
                      color: data.getcolor.primaryColor,
                    ),
                    AppServices.addWidth(10),
                    Expanded(
                      child: Text(
                        "One-Time Order",
                        style: widget.data.gettexttheme.fs16_regular
                            .copyWith(color: data.getcolor.primaryColor),
                      ),
                    ),
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

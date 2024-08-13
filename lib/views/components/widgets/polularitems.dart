import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/popular_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

// ignore: must_be_immutable
class Polularitems extends StatefulWidget {
  PopularModel datamodel;
  Polularitems({super.key, required this.datamodel});

  @override
  State<Polularitems> createState() => _PolularitemsState();
}

class _PolularitemsState extends State<Polularitems> {
  ///Helpers
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      verticalPadding: 0,
      horizontalPadding: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(widget.datamodel.image)),
          AppServices.addHeight(5),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.datamodel.contry,
              style: data.gettexttheme.fs20_bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              widget.datamodel.ingredients,
              style: data.gettexttheme.fs14_regular,
            ),
          ),
          AppServices.addHeight(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: data.getcolor.primaryColor,
                    ),
                    AppServices.addWidth(5),
                    Text(
                      widget.datamodel.likes,
                      style: data.gettexttheme.fs12_regular
                          .copyWith(color: data.getcolor.primaryColor),
                    ),
                    SizedBox(
                      height: 15,
                      child: VerticalDivider(
                        color: data.getcolor.primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: data.getcolor.primaryColor,
                    ),
                    AppServices.addWidth(5),
                    Text(
                      widget.datamodel.rating,
                      style: data.gettexttheme.fs12_regular
                          .copyWith(color: data.getcolor.primaryColor),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Starting From",
                    style: data.gettexttheme.fs12_regular,
                  ),
                  AppServices.addWidth(10),
                  Text(
                    widget.datamodel.price,
                    style: data.gettexttheme.fs20_bold
                        .copyWith(color: data.getcolor.primaryColor),
                  ),
                ],
              ),
            ],
          ),
          AppServices.addHeight(10)
        ],
      ),
    );
  }
}

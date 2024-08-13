import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/model/transaction.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

// ignore: must_be_immutable
class Transaction_widget extends StatelessWidget {
  TransactionModel modeldata;
  Transaction_widget({super.key, required this.modeldata});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      verticalPadding: 0,
      horizontalPadding: 0,
      // decoration: BoxDecoration(
      //   color: data.getcolor.white,
      //   borderRadius: BorderRadius.circular(15),
      // ),
      child: ListTile(
          horizontalTitleGap: 6,
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          leading: Image.asset(modeldata.img),
          title: Text(modeldata.name, style: data.gettexttheme.fs18_medium),
          subtitle: Row(
            children: [
              Text("Tr. Date : ${modeldata.date}",
                  style: data.gettexttheme.fs10_regular),
              AppServices.addWidth(10),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(

                    
                     
                      borderRadius: BorderRadius.circular(10.r),
                      color: modeldata.status.color.withOpacity(0.3)),
                  child: Text(modeldata.status.getTitle(),
                      style: data.gettexttheme.fs10_regular
                          .copyWith(color: modeldata.status.color))),
            ],
          ),
          trailing: Text.rich(TextSpan(children: [
            TextSpan(
              text: "₹",
              style: data.gettexttheme.fs12_regular
                  .copyWith(color: modeldata.status.color),
            ),
            TextSpan(
                text: modeldata.ruppes,
                style: data.gettexttheme.fs22_bold
                    .copyWith(color: modeldata.status.color)),
            TextSpan(
                text: ".00 ",
                style: data.gettexttheme.fs12_regular
                    .copyWith(color: modeldata.status.color)),
          ]))),
    );
  }
}

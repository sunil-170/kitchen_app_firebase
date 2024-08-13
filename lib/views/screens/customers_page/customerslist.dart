import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/widgets/customerslist.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';

class CustomersList extends StatelessWidget {
  const CustomersList({super.key});

  @override
  Widget build(BuildContext context) {
    ///Helpers
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConsts.Customersl.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //-------------------------------CUSTOMERS LIST  DATA -------------------------------------------------------
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                shrinkWrap: true,
                itemCount: Customerslisthelpers.list.length,
                itemBuilder: (context, index) =>
                    Customerslist(modeldata: Customerslisthelpers.list[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

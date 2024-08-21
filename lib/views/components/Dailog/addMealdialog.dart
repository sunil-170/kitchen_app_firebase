import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/TodayMealModal.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/utils/primary_decorations.dart';
import 'package:kitchen_app/view_model/TodayMealController/Todaymealcontroller.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class AddMealDialog extends StatefulWidget {
  AddMealDialog({super.key});

  @override
  State<AddMealDialog> createState() => _AddMealDialogState();
}

class _AddMealDialogState extends State<AddMealDialog> {
  String selectmeal = "";
  List<String> category_type = ["Roti", "Sabzi", "Rice", "Salad"];
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Todaymealcontroller>();

    ///-----------------Helpers-------------------------------
    var style = alldataManager;
    return Dialog(
      // insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: style.getcolor.sccfoldcolor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Meal Type ***************************///
            Container(
              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 16.w),
              decoration: PrimaryDecorations.primaryboxDecoration
              // BoxDecoration(
              //     color: style.getcolor.white,
              //     borderRadius: BorderRadius.circular(10.r)),
              ,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text("Select Category"),
                  isExpanded: true,
                  isDense: true,
                  value: selectmeal.isEmpty ? null : selectmeal,
                  style: style.gettexttheme.fs14_regular
                      .copyWith(color: style.getcolor.gray),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  items: category_type.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: style.gettexttheme.fs14_regular
                            .copyWith(color: style.getcolor.gray),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectmeal = newValue!;
                    });
                  },
                ),
              ),
            ),
            AppServices.addHeight(10),
            PrimaryContainer(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                      style.getimg.shahipaneer_img,
                      fit: BoxFit.cover,
                    ),
                    AppServices.addWidth(10),
                    Text("Shahi Paneer")
                  ],
                ),
                Checkbox(
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    splashRadius: 0.0,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: style.getcolor.primaryColor,
                    value: isSelected,
                    onChanged: (newvalue) {
                      setState(() {
                        isSelected = newvalue!;
                      });
                      // print(isSelected);
                    }),
              ],
            )),
            AppServices.addHeight(10),
            Align(
              alignment: Alignment.bottomRight,
              child: PrimaryButton(
                  foregroundColor: style.getcolor.white,
                  backgroundColor: style.getcolor.primaryColor,
                  title: "Save",
                  onPressed: () {
                    /// save meal type function here************///
                    // controller.setmeal(AddMealModal(meals: [
                    //   MealsModal(
                    //     meal_type: selectmeal,
                    //   )
                    // ]));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/buttons/radio_btn.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';

class Sale_Report_dailog extends StatefulWidget {
  const Sale_Report_dailog({super.key});

  @override
  State<Sale_Report_dailog> createState() => _Sale_Report_dailogState();
}

class _Sale_Report_dailogState extends State<Sale_Report_dailog> {
  final TextEditingController datemonthyear = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String selectedCustomDate = "";
  String selectedCurrentWeek = "";
  String SelectCurrentMonth = "";
  String DeliveryBetweenDates = "";
  @override
  Widget build(BuildContext context) {
    ///-----------------Helpers-------------------------------
    var data = alldataManager;
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: data.getcolor.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sale Report',
            style: data.gettexttheme.fs22_medium
                .copyWith(color: data.getcolor.primaryColor),
          ),
          Radio_fun(
            text: 'Custom Date',
            onDone: (p0) {
              setState(() {
                selectedCustomDate = p0;
                selectedCurrentWeek = "";
                selectedCustomDate = "";
                SelectCurrentMonth = "";
              });
            },
            value: selectedCustomDate,
          ),
          Customtextformfilled(
            ontap: () async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2015),
                  lastDate: selectedDate);
              if (picked != null) {
                setState(() {
                  datemonthyear.text = "${picked.toLocal()}".split(" ")[0];
                });
              }
            },
            prifixicon: Icons.calendar_month,
            hintText: "dd/mm/yyyy",
            controller: datemonthyear,
            style: data.gettexttheme.fs12_medium
                .copyWith(color: data.getcolor.black40),
            fillcolor: data.getcolor.tranceparent,
          ),
          Radio_fun(
            text: 'Current Week',
            onDone: (p0) {
              setState(() {
                selectedCurrentWeek = p0;
              });
            },
            value: selectedCurrentWeek,
          ),
          Radio_fun(
            text: 'Current Month',
            onDone: (p0) {
              setState(() {
                SelectCurrentMonth = p0;
              });
            },
            value: SelectCurrentMonth,
          ),
          Radio_fun(
            text: 'Between Dates',
            onDone: (p0) {
              setState(() {
                DeliveryBetweenDates = p0;
              });
            },
            value: DeliveryBetweenDates,
          ),
          SizedBox(
            width: 300,
            child: GradientDivider(
              data: data,
              middleGradient: true,
            ),
          ),
          AppServices.addHeight(15),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                    title: "Generate Report",
                    onPressed: () {
                      // Get.toNamed(Routesname.OTPVerificationScreen);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Customtextformfilled extends StatefulWidget {
  TextEditingController? controller;
  IconData? icon;
  IconData? prifixicon;
  String? imageicon;
  Icon? icons;
  bool darkHint;
  Function? onSufixPressed;
  bool isExpanded;
  String? hintText;
  Function(String?)? validator;
  bool obsecure;
  Color? fillcolor;
  Function(String?)? onchange;
  TextStyle? style;
  TextInputType? Keyboradtype;
  int? maxlength;
  Function? ontap;

  Customtextformfilled(
      {super.key,
      this.icon,
      this.ontap,
      this.imageicon,
      this.prifixicon,
      this.isExpanded = false,
      this.onSufixPressed,
      this.darkHint = false,
      this.obsecure = false,
      this.controller,
      this.hintText,
      this.onchange,
      this.validator,
      this.style,
      this.fillcolor,
      this.Keyboradtype,
      this.maxlength});

  @override
  State<Customtextformfilled> createState() => _CustomtextformfilledState();
}

class _CustomtextformfilledState extends State<Customtextformfilled> {
  @override
  Widget build(BuildContext context) {
    final textfield = TextFormField(
        maxLength: widget.maxlength,
        keyboardType: widget.Keyboradtype,
        style:
            data.gettexttheme.fs12_medium.copyWith(color: data.getcolor.black),
        controller: widget.controller,
        obscureText: widget.obsecure,
        onChanged: widget.onchange,
        onTap: () {
          widget.ontap == null ? null : widget.ontap!();
        },
        validator: widget.validator == null
            ? null
            : (value) => widget.validator!(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillcolor,
            hintText: widget.hintText,
            hintStyle: widget.style,
            prefixIcon: widget.prifixicon != null
                ? Icon(
                    widget.prifixicon,
                  )
                : (widget.imageicon != null)
                    ? Image.asset(
                        widget.imageicon!,
                        scale: 2.8,
                      )
                    : SizedBox(),
            suffixIcon: IconButton(
                color: data.getcolor.black20,
                onPressed: widget.onSufixPressed != null
                    ? () => widget.onSufixPressed!()
                    : null,
                icon: Icon(
                  widget.icon,
                  color: data.getcolor.black20,
                )),
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: data.getcolor.black10)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 219, 217, 217),
                    width: 1.5))));
    return widget.isExpanded ? Expanded(child: textfield) : textfield;
  }
}

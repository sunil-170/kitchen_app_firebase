part of '../DashBoard.dart';

// ignore: must_be_immutable
class _ReportWidgets extends StatefulWidget {
  Color lightcolor, darkcolor, textcolor;
  String icons, text;

  _ReportWidgets(
      {required this.lightcolor,
      required this.darkcolor,
      required this.textcolor,
      required this.text,
      required this.icons});

  @override
  State<_ReportWidgets> createState() => _ReportWidgetsState();
}

class _ReportWidgetsState extends State<_ReportWidgets> {
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: widget.lightcolor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                height: 84,
                decoration: BoxDecoration(
                    color: widget.darkcolor,
                    borderRadius: BorderRadius.circular(10)),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      widget.icons,
                      scale: 2.5,
                      color: data.getcolor.white,
                    )),
              ),
            ],
          ),
        ),
        AppServices.addHeight(10),
        Text(
          widget.text,
          style:
              data.gettexttheme.fs16_regular.copyWith(color: widget.textcolor),
        )
      ],
    );
  }
}

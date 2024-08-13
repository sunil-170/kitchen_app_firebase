part of '../DashBoard.dart';

// ignore: must_be_immutable
class _Weeklyreporkwidget extends StatefulWidget {
  String icons, tittle, persent, plusgrade;
  Color bgcolor;
  _Weeklyreporkwidget(
      {required this.icons,
      required this.persent,
      required this.plusgrade,
      required this.bgcolor,
      required this.tittle});

  @override
  State<_Weeklyreporkwidget> createState() => _WeeklyreporkwidgetState();
}

class _WeeklyreporkwidgetState extends State<_Weeklyreporkwidget> {
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: widget.bgcolor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: data.getcolor.white, shape: BoxShape.circle),
            child: Image.asset(
              widget.icons,
              scale: 2.5,
            ),
          ),
          AppServices.addWidth(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.tittle,
                style: data.gettexttheme.fs16_regular,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.persent,
                    style: data.gettexttheme.fs16_bold,
                  ),
                  AppServices.addWidth(20),
                  Image.asset(
                    data.geticons.arrowright,
                    scale: 2.4,
                  ),
                  AppServices.addWidth(20),
                  Text(
                    widget.plusgrade,
                    style: data.gettexttheme.fs16_bold
                        .copyWith(color: data.getcolor.green),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

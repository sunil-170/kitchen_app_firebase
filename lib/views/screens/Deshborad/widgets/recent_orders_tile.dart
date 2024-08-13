part of '../DashBoard.dart';

class _RecentOrdersTile extends StatelessWidget {
  const _RecentOrdersTile({
    required this.data,
  });

  final AllDataManager data;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      border: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000.r),
                child: Image.asset(
                  data.getimg.chapat2,
                  height: 80.w,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
              AppServices.addWidth(10),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "North Indian Meal",
                            style: data.gettexttheme.fs20_bold,
                          ),
                          Text(
                            "Soy,  Rice, Bell paper, Penuts",
                            style: data.gettexttheme.fs14_regular
                                .copyWith(color: data.getcolor.black60),
                          ),
                        ],
                      ),
                    ),
                    AppServices.addWidth(10),
                    Text(
                      "₹70 /-",
                      style: data.gettexttheme.fs20_bold
                          .copyWith(color: data.getcolor.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppServices.addHeight(15),
          GradientDivider(data: data, middleGradient: true),
          AppServices.addHeight(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: data.getcolor.lightred,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Pending",
                  style: data.gettexttheme.fs14_regular
                      .copyWith(color: data.getcolor.primaryColor),
                ),
              ),
              Text(
                "June 21, 2024",
                style: data.gettexttheme.fs16_regular
                    .copyWith(color: data.getcolor.black40),
              )
            ],
          )
        ],
      ),
    );
  }
}

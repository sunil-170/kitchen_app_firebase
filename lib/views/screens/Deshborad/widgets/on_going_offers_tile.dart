part of '../DashBoard.dart';

class _OnGoingOffersTile extends StatelessWidget {
  const _OnGoingOffersTile({
    required this.data,
  });

  final AllDataManager data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: data.getcolor.lightred),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppServices.addHeight(10),
                Text(
                  LanguageConsts.twentyPercentOff.tr,
                  style: data.gettexttheme.fs20_bold,
                ),
                AppServices.addHeight(5),
                Text(
                  "Avail this order on your first order*",
                  maxLines: 2,
                  style: data.gettexttheme.fs12_regular,
                ),
                AppServices.addHeight(5),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: data.getcolor.primaryColor),
                  child: Text(
                    "Order Now",
                    style: data.gettexttheme.fs16_regular
                        .copyWith(color: data.getcolor.white),
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            data.getimg.chapatiimg,
            scale: 3,
          )
        ],
      ),
    );
  }
}

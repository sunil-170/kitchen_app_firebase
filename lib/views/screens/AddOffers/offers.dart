import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/model/offers_model.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/view_model/controllers/offers/offers_controllers.dart';
import 'package:kitchen_app/views/components/divider/vertical_dviders.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class OfferListScreen extends StatelessWidget {
  final OfferController offerController = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: "Offers List"),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            // separatorBuilder: (context, index) => SizedBox(
            //   height: 10,
            // ),
            itemCount: offerController.offers.length,
            itemBuilder: (context, index) {
              final offer = offerController.offers[index];
              return OfferCard(offer: offer);
            },
          ),
        );
      }),
    );
  }
}

class OfferCard extends StatelessWidget {
  final Offer offer;

  OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    final style = alldataManager;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: CustomPaint(
        painter: _ClipShadowShadowPainter(
            shadow: BoxShadow(
                color: data.getcolor.black10,
                blurRadius: 12,
                spreadRadius: 0,
                offset: Offset(0, 0)),
            clipper: LeftWaveClipper()),
        child: Stack(alignment: AlignmentDirectional.topEnd, children: [
          ClipPath(
            clipper: LeftWaveClipper(),
            child: PrimaryContainer(
              // border: true,
              // shadow: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    offer.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  AppServices.addWidth(10),
                  CustomPaint(
                    size: Size(1, 100),
                    painter: DashedLineVerticalPainter(),
                  ),
                  AppServices.addWidth(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer.title,
                          style: style.gettexttheme.fs22_medium
                              .copyWith(color: style.getcolor.primaryColor),
                        ),
                        Text(
                          "Special Discount (%)",
                          style: style.gettexttheme.fs14_regular
                            ..copyWith(
                                color: style.getcolor.gray.withOpacity(0.1)),
                        ),
                        Text(
                          "${offer.discount}% OFF",
                          style: style.gettexttheme.fs20_regular
                              .copyWith(color: style.getcolor.primaryColor),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "This Voucher Valid Until: ",
                            style: style.gettexttheme.fs10_regular
                                .copyWith(color: style.getcolor.gray),
                          ),
                          TextSpan(
                              text: offer.validUntil,
                              style: style.gettexttheme.fs14_medium),
                        ])),
                        // Text("This Voucher Valid Until: ${offer.validUntil}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuButton<String>(
            color: style.getcolor.white,
            surfaceTintColor: style.getcolor.white,
            offset: Offset(-15, 8),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            onSelected: (value) {
              if (value == 'edit') {
                // Handle edit action
              } else if (value == 'delete') {}
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                padding: EdgeInsets.all(5),
                height: 30.h,
                value: 'edit',
                child: Center(child: Text('Edit', textAlign: TextAlign.center)),
              ),
              PopupMenuItem(
                // value: 'edit',

                height: 1,
                padding: EdgeInsets.all(5),
                enabled: false,
                child: Center(child: SizedBox(width: 150, child: Divider())),
              ),
              PopupMenuItem(
                padding: EdgeInsets.all(5),
                height: 30.h,
                value: 'delete',
                child: Center(child: Text('Delete')),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class LeftWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double startSpacing = 15.0;
    double endSpacing = 15.0;
    int numberOfCurves = 6;
    double curveHeight = 12.0;
    double curveWidth = 12.0;
    double straightLineHeight = (size.height -
            startSpacing -
            endSpacing -
            (numberOfCurves * curveHeight)) /
        (numberOfCurves - 1);

    path.moveTo(0, 0);

    for (int i = 0; i < numberOfCurves; i++) {
      path.lineTo(0, startSpacing + i * (curveHeight + straightLineHeight));
      path.quadraticBezierTo(
        curveWidth / 2,
        startSpacing + i * (curveHeight + straightLineHeight) + curveHeight / 2,
        0,
        startSpacing + i * (curveHeight + straightLineHeight) + curveHeight,
      );
      if (i < numberOfCurves - 1) {
        path.lineTo(
            0,
            startSpacing +
                i * (curveHeight + straightLineHeight) +
                curveHeight +
                straightLineHeight);
      }
    }

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

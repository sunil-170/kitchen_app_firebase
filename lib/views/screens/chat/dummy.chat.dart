import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/view_model/controllers/chat/chat_contollers.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';

class DummyChat extends StatefulWidget {
  @override
  State<DummyChat> createState() => _DummyChatState();
}

class _DummyChatState extends State<DummyChat> {
  final chatController = Get.find<ChatController>();

  ///--------------------------Helpers-----------------------------
  var data = alldataManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: "Daba Wala"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: 240,
            //   padding: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //       color: data.getcolor.lightred,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //           bottomRight: Radius.circular(10))),
            //   child: Text(
            //     "Not To Bad, Just Trying To Survive This Week. You?",
            //     style: data.gettexttheme.fs14_regular
            //         .copyWith(color: data.getcolor.primaryColor),
            //   ),
            // ),
            // AppServices.addHeight(5),
            // Text("07:40 AM", style: data.gettexttheme.fs12_regular),
            // AppServices.addHeight(15),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Container(
            //         width: 240,
            //         padding: EdgeInsets.all(15),
            //         decoration: BoxDecoration(
            //             color: data.getcolor.primaryColor,
            //             borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(10),
            //                 topRight: Radius.circular(10),
            //                 bottomRight: Radius.circular(10))),
            //         child: Text(
            //           "Not To Bad, Just Trying To Survive This Week. You?",
            //           style: data.gettexttheme.fs14_regular
            //               .copyWith(color: data.getcolor.white),
            //         ),
            //       ),
            //       AppServices.addHeight(5),
            //       Text("07:40 AM", style: data.gettexttheme.fs12_regular),
            //       Container(
            //         width: 240,
            //         padding: EdgeInsets.all(15),
            //         decoration: BoxDecoration(
            //             color: data.getcolor.primaryColor,
            //             borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(10),
            //                 topRight: Radius.circular(10),
            //                 bottomLeft: Radius.circular(10))),
            //         child: Text(
            //           "Not To Bad, Just Trying To Survive This Week. You?",
            //           style: data.gettexttheme.fs14_regular
            //               .copyWith(color: data.getcolor.white),
            //         ),
            //       ),
            //       AppServices.addHeight(5),
            //       Text("07:40 AM", style: data.gettexttheme.fs12_regular),
            //     ],
            //   ),
            // ),
            // AppServices.addHeight(15),
            // Container(
            //   width: 240,
            //   padding: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //       color: data.getcolor.lightred,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //           bottomLeft: Radius.circular(10))),
            //   child: Text(
            //     "Not To Bad, Just Trying To Survive This Week. You?",
            //     style: data.gettexttheme.fs14_regular
            //         .copyWith(color: data.getcolor.primaryColor),
            //   ),
            // ),
            // AppServices.addHeight(5),
            // Text("07:40 AM", style: data.gettexttheme.fs12_regular),
            // AppServices.addHeight(15),
            // Container(
            //   width: 240,
            //   padding: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //       color: data.getcolor.lightred,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //           bottomRight: Radius.circular(10))),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Not To Bad, Just Trying To Survive This Week. You?",
            //         style: data.gettexttheme.fs14_regular
            //             .copyWith(color: data.getcolor.primaryColor),
            //       ),
            //       AppServices.addHeight(10),
            //       OutlinedButton.icon(
            //         onPressed: () {
            //           // Add continue chat action
            //         },
            //         icon: Icon(Icons.chat, color: data.getcolor.primaryColor),
            //         label: Text('CONTINUE CHAT',
            //             style: data.gettexttheme.fs12_regular
            //                 .copyWith(color: data.getcolor.primaryColor)),
            //         style: OutlinedButton.styleFrom(
            //           shape: BeveledRectangleBorder(
            //               borderRadius: BorderRadius.circular(5)),
            //           backgroundColor: data.getcolor.white,
            //           side: BorderSide(color: data.getcolor.white),
            //         ),
            //       ),
            //       AppServices.addHeight(10),
            //       OutlinedButton.icon(
            //         onPressed: () {
            //           // Add continue chat action
            //         },
            //         icon: Icon(Icons.phone, color: data.getcolor.green),
            //         label: Text('CALL US',
            //             style: data.gettexttheme.fs12_regular
            //                 .copyWith(color: data.getcolor.green)),
            //         style: OutlinedButton.styleFrom(
            //           shape: BeveledRectangleBorder(
            //               borderRadius: BorderRadius.circular(5)),
            //           backgroundColor: data.getcolor.white,
            //           side: BorderSide(color: data.getcolor.white),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // AppServices.addHeight(5),
            // Text("07:40 AM", style: data.gettexttheme.fs12_regular),
            // AppServices.addHeight(25),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //       color: data.getcolor.textfieldcolor,
            //       borderRadius: BorderRadius.circular(100)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Type Message....",
            //           style: data.gettexttheme.fs12_regular),
            //       Icon(Icons.send)
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

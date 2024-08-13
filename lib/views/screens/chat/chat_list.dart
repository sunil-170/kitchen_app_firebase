import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/model/customerslist_model.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Chat {
  final String name;
  final String message;
  final String time;
  final String image;
  final int unreadMessages;

  Chat(
      {required this.image,
      required this.name,
      required this.message,
      required this.time,
      this.unreadMessages = 0});
}

// ignore: must_be_immutable
class Chat_List extends StatelessWidget {
  var data = alldataManager;
  final List<Chat> chats = [
    Chat(
        image: "assets/icons/profile.png",
        name: "Mr. Joginder saini ",
        message: "Not Too Bad, Just Trying To Survive......",
        time: "12:10 PM",
        unreadMessages: 2),
    Chat(
        image: "assets/icons/profile.png",
        name: "Mr. Aman",
        message: "Not Too Bad, Just Trying To Survive......",
        time: "12:10 PM",
        unreadMessages: 2),
    Chat(
        image: "assets/icons/profile.png",
        name: "Mr. Sunil",
        message: "Not Too Bad, Just Trying To Survive......",
        time: "12:10 PM"),
    Chat(
        image: "assets/icons/profile.png",
        name: "Mr. Mandeep",
        message: "Not Too Bad, Just Trying To Survive......",
        time: "12:10 PM"),
    Chat(
        image: "assets/icons/profile.png",
        name: "Mr. Sunil",
        message: "Not Too Bad, Just Trying To Survive......",
        time: "12:10 PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: "Chat List"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return ChatItem(chat: chats[index]);
          },
        ),
        
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final Chat chat;

  ChatItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: ListTile(
        onTap: () {
          Get.toNamed(Routesname.view_chat);
        },
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(chat.image),
        title: Text(
          chat.name,
          style: data.gettexttheme.fs18_medium,
        ),
        subtitle: Text(
          chat.message,
          style: data.gettexttheme.fs12_regular,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (chat.unreadMessages > 0)
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                    color: data.getcolor.primaryColor, shape: BoxShape.circle),
                child: Text(
                  chat.unreadMessages.toString(),
                  style: TextStyle(color: data.getcolor.white),
                ),
              ),
            Text(chat.time),
          ],
        ),
      ),
    );
    
  }
}

import 'package:doctor_app_assessment/chat/bloc/chat_bloc.dart';
import 'package:doctor_app_assessment/chat/view/conversation_list.dart';
import 'package:doctor_app_assessment/common/routes/routes.dart';
import 'package:doctor_app_assessment/common/services/navigation_service.dart';
import 'package:doctor_app_assessment/home/network/model/common/chatUsersModel.dart';
import 'package:doctor_app_assessment/util/assets.dart';
import 'package:doctor_app_assessment/util/colors.dart';
import 'package:doctor_app_assessment/util/common_widgets/app_text_widget.dart';
import 'package:doctor_app_assessment/util/string_constant.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppTextWidget(
                      text: "${stringConstant.chat}",
                      size: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "${stringConstant.search_here}",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatBloc.chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  onclick: () {
                    chatBloc.setChatUsers(chatUsers: chatBloc.chatUsers[index]);
                    appNavigationService.pushNamed(Routes.chat_detail_screen);
                  },
                  name: chatBloc.chatUsers[index].name!,
                  messageText: chatBloc.chatUsers[index].messageText!,
                  imageUrl: chatBloc.chatUsers[index].imageURL!,
                  time: chatBloc.chatUsers[index].time!,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

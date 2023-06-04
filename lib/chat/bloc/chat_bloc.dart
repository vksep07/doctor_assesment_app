import 'package:doctor_app_assessment/chat/network/model/chat_message_model.dart';
import 'package:doctor_app_assessment/home/network/model/common/chatUsersModel.dart';
import 'package:doctor_app_assessment/util/assets.dart';

class ChatBloc {
  ChatUsers? chatUserSelected;

  ChatUsers? getchatUser() {
    return chatUserSelected;
  }

  void setChatUsers({ChatUsers? chatUsers}) {
    this.chatUserSelected = chatUsers;
  }

  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "${Assets.doctor1}",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "${Assets.doctor2}",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "${Assets.doctor3}",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "${Assets.doctor4}",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "${Assets.doctor5}",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "${Assets.appLogo}",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "${Assets.appLogo}",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL: "${Assets.appLogo}",
        time: "18 Feb"),
  ];

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
}

final chatBloc = ChatBloc();

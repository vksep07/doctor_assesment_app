import 'package:doctor_app_assessment/common/routes/routes.dart';
import 'package:doctor_app_assessment/common/services/navigation_service.dart';
import 'package:doctor_app_assessment/util/common_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  Function? onclick;

  ConversationList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead,
      this.onclick
      });

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onclick != null) {
          widget.onclick!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('${widget.imageUrl}'),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppTextWidget(
                            text: widget.name,
                            size: 16,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          AppTextWidget(
                            text: widget.messageText,
                            size: 13,
                            color: Colors.grey.shade600,
                            fontWeight: widget.isMessageRead
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppTextWidget(
                text: widget.time,
                size: 12,
                fontWeight:
                    widget.isMessageRead ? FontWeight.bold : FontWeight.normal),
          ],
        ),
      ),
    );
  }
}

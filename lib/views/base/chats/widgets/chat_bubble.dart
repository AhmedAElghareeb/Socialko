import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialko/views/base/chats/model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key, required this.msg,
  });

  final MessageModel msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 32.w, top: 32.h, bottom: 32.h),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 16.r, vertical: 12.h),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            )),
        child: Text(
          msg.message,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AnotherChatBubble extends StatelessWidget {
  const AnotherChatBubble({
    super.key, required this.msg,
  });

  final MessageModel msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 32.w, top: 32.h, bottom: 32.h),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 16.r, vertical: 12.h),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
              bottomLeft: Radius.circular(20.r),
            )),
        child: Text(
          msg.message,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:socialko/utils/widgets.dart';
import 'package:socialko/views/auth/logout/bloc.dart';
import 'package:socialko/views/base/chats/model.dart';
import 'package:socialko/views/base/chats/widgets/chat_bubble.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection("messages");

  final _controller = ScrollController();

  final msgController = TextEditingController();

  final bloc = KiwiContainer().resolve<LogOutBloc>();

  final event = StartLogOutEvent();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          List<MessageModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Chat"),
                  SizedBox(
                    width: 15.w,
                  ),
                  SvgPicture.asset("assets/icons/logo.svg"),
                ],
              ),
              actions: [
                BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        bloc.add(event);
                      },
                      icon: const Icon(Icons.exit_to_app, color: Colors.black,),
                    );
                  },
                ),
              ],
            ),
            body: snapshot.hasData == true
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemBuilder: (context, index) =>
                              messageList[index].id == email
                                  ? ChatBubble(
                                      msg: messageList[index],
                                    )
                                  : AnotherChatBubble(
                                      msg: messageList[index],
                                    ),
                          itemCount: messageList.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(10.r),
                        child: InputField(
                          controller: msgController,
                          icon: Icons.send_outlined,
                          label: "Send Message....",
                          keyboardType: TextInputType.text,
                          onSuffixPressed: () {
                            messages.add({
                              'message': msgController.text,
                              'createdAt': DateTime.now(),
                              'id': email,
                            });
                            msgController.clear();
                            _controller.animateTo(
                              0,
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: Text("No Messages Yet..."),
                  ),
          );
        });
  }
}

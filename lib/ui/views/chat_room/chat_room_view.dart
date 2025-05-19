import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:petvillage_app/models/message_model.dart';
import 'chat_room_viewmodel.dart';

class ChatRoomView extends StackedView<ChatRoomViewModel> {
  const ChatRoomView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChatRoomViewModel viewModel,
    Widget? child,
  ) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final roomId = args != null ? args['roomId'] as String : '';
    
    // reverse once
    final displayed = viewModel.messages.reversed.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/shop_profile.png'),
              radius: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Pets store01',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(8),
                itemCount: displayed.length,
                itemBuilder: (context, index) {
                  final Message message = displayed[index];
                  final isUser = message.senderType == 'User';

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: isUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (!isUser)
                          const CircleAvatar(
                            radius: 14,
                            backgroundImage:
                                AssetImage('assets/icons/store_icon.png'),
                          ),
                        if (!isUser) const SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUser
                                  ? const Color(0xFFB4D9C1)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(12),
                                topRight: const Radius.circular(12),
                                bottomLeft: Radius.circular(isUser ? 12 : 0),
                                bottomRight: Radius.circular(isUser ? 0 : 12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 3,
                                  offset: const Offset(1, 1),
                                )
                              ],
                            ),
                            child: Text(message.content),
                          ),
                        ),
                        if (isUser) const SizedBox(width: 8),
                        if (isUser)
                          const CircleAvatar(
                            radius: 14,
                            backgroundImage:
                                AssetImage('assets/icons/user_icon.png'),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: viewModel.messageController,
                        decoration: const InputDecoration(
                          hintText: 'พิมพ์ข้อความ....',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: viewModel.sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChatRoomViewModel viewModelBuilder(BuildContext context) =>
      ChatRoomViewModel();

  @override
  void onViewModelReady(ChatRoomViewModel viewModel) {
    viewModel.init();
  }
}

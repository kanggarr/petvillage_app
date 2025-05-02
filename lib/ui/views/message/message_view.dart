import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'message_viewmodel.dart';

class MessageView extends StackedView<MessageViewModel> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ข้อความ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.messageList.length,
                  itemBuilder: (context, index) {
                    final message = viewModel.messageList[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      leading: const CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                            'assets/shop_icon.png'), // เปลี่ยนตามจริง
                      ),
                      title: Text(
                        message.shopName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xFF242424)),
                      ),
                      subtitle: Text(
                        message.lastMessage,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF808080),
                        ),
                      ),
                      trailing: Text(
                        message.time,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF808080)),
                      ),
                      onTap: () {
                        viewModel.navigateToChat(message.shopId);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MessageViewModel viewModelBuilder(BuildContext context) => MessageViewModel();
}

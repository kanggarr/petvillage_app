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
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ข้อความ',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: viewModel.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : viewModel.messageList.isEmpty
                        ? const Center(
                            child: Text(
                              'เริ่มต้นการสนทนา',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF808080),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: viewModel.messageList.length,
                            itemBuilder: (context, index) {
                              final message = viewModel.messageList[index];
                              return ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                leading: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: AssetImage(
                                    message.profileImage.isNotEmpty
                                        ? message.profileImage
                                        : viewModel.userRole == 'shop'
                                            ? 'assets/images/free.png'
                                            : 'assets/images/shop_profile.png',
                                  ),
                                ),
                                title: Text(
                                  message.shopName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Color(0xFF242424),
                                  ),
                                ),
                                trailing: Text(
                                  message.time,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xFF808080),
                                  ),
                                ),
                                onTap: () {
                                  viewModel.navigateToChat(
                                      message.roomId, message.shopName);
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
  void onViewModelReady(MessageViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  MessageViewModel viewModelBuilder(BuildContext context) => MessageViewModel();
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_room_viewmodel.dart';

class ChatRoomView extends StackedView<ChatRoomViewModel> {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatRoomViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ChatRoomView")),
      ),
    );
  }

  @override
  ChatRoomViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatRoomViewModel();
}

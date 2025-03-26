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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  MessageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessageViewModel();
}

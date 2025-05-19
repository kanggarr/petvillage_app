import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/post_adopt.dart';
import 'package:petvillage_app/ui/widgets/post_blog.dart';
import 'package:petvillage_app/ui/widgets/post_toggle.dart';
import 'package:stacked/stacked.dart';

import 'post_viewmodel.dart';

class PostView extends StackedView<PostViewModel> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PostViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'สร้างโพสต์',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              if (viewModel.userRole == 'shop')
              PostToggle(viewModel: viewModel),
              const SizedBox(height: 20),
              if (viewModel.selectedCategory == 'บล็อก')
                PostBlogForm(viewModel: viewModel),
              if (viewModel.selectedCategory == 'ขาย/รับเลี้ยง')
                PostAdoptForm(viewModel: viewModel),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: viewModel.canPost ? viewModel.createPost : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewModel.canPost
                        ? const Color(0xFF4F9451)
                        : Colors.grey[400],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'สร้างโพสต์',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget body(PostViewModel viewModel) {
    if (viewModel.userRole == 'user') {
      return PostBlogForm(viewModel: viewModel);
    } else {
      if (viewModel.selectedCategory == 'บล็อก') {
        return PostBlogForm(viewModel: viewModel);
      }
      if (viewModel.selectedCategory == 'ขาย/รับเลี้ยง') {
        return PostAdoptForm(viewModel: viewModel);
      }
    }
    return Container();
  }

  @override
  PostViewModel viewModelBuilder(BuildContext context) => PostViewModel();
}

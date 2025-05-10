import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'blog_detail_viewmodel.dart';

class BlogDetailView extends StackedView<BlogDetailViewModel> {
  const BlogDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BlogDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pet Village Blog",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF242424)),
            ),
            SizedBox(height: 12),
          ],
        ),
      )),
    );
  }

  @override
  BlogDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BlogDetailViewModel();
}

import 'package:flutter/material.dart';
import 'package:petvillage_app/models/blog_model.dart';
import 'package:stacked/stacked.dart';

import 'blog_detail_viewmodel.dart';

class BlogDetailView extends StackedView<BlogDetailViewModel> {
  final BlogModel blogModel;

  const BlogDetailView({Key? key, required this.blogModel}) : super(key: key);

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
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pet Village Blog",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424)),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  'assets/images/dog.png',
                  // blogModel.images.isNotEmpty
                  //     ? blogModel.images[0]!
                  //     : 'assets/images/blog_default.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(blogModel.titleName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        child: Text(
                          blogModel.description,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
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

import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/blog_card.dart';
import 'package:stacked/stacked.dart';
import 'blog_viewmodel.dart';

class BlogView extends StackedView<BlogViewModel> {
  const BlogView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BlogViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('สวัสดี, ผู้ใช้งาน'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ค้นหา...',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return BlogCard(
                    onPressed: viewModel.navigateToPetDetail,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BlogViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BlogViewModel();
}

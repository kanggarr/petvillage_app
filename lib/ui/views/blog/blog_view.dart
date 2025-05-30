import 'package:flutter/material.dart';
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
                  return _buildCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return const Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image, size: 40),
          SizedBox(height: 8),
          Text('...ข้อมูลเพิ่มเติม...', textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  BlogViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BlogViewModel();
}

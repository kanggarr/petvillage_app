import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petvillage_app/ui/common/assets.dart';
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
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  // backgroundImage: AssetImage(
                  //     'assets/images/avatar.png'), // TODO: รอเอารูปจาก database
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Smith', // TODO: รอชื่อจาก database
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // Text(
                    //   'General user',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ค้นหา...',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SvgPicture.asset(
                          Assets.assetsIconsSearchIcon,
                        ),
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: viewModel.blogs.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 230,
                      ),
                      itemCount: viewModel.blogs.length,
                      itemBuilder: (context, index) {
                        return BlogCard(
                          onPressed: () {
                            viewModel.navigateToBlogDetail(index);
                          },
                          imageUrl:
                              viewModel.blogs[index].images.firstOrNull ?? '',
                          title: viewModel.blogs[index].titleName,
                          subtitle: 'ก่อนรับเลี้ยงสัตว์เลี้ยง',
                          description: viewModel.blogs[index].description,
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
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

  @override
  void onViewModelReady(
    BlogViewModel viewModel,
  ) {
    viewModel.getBlogs();
  }
}

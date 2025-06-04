import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/views/post/post_viewmodel.dart';
import 'package:petvillage_app/ui/widgets/image_picker.dart';

class PostBlogForm extends StatelessWidget {
  final PostViewModel viewModel; // Add this line to define viewModel

  const PostBlogForm({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'หัวข้อ',
          style: TextStyle(
              fontSize: 15,
              color: Color(0xFF808080),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            controller: viewModel.blogTitleController,
            decoration: InputDecoration(
              hintText: 'กรอกหัวข้อ',
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.normal,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF000000))),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: viewModel.onChangeTitle,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'รูปภาพ',
          style: TextStyle(
              fontSize: 15,
              color: Color(0xFF808080),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        ImagePickerWidget(onImagesChanged: (images) {
          viewModel.setImages(images); // หรือเก็บในตัวแปรใน ViewModel
        }),
        const SizedBox(height: 20),
        const Text(
          'รายละเอียด',
          style: TextStyle(
              fontSize: 15,
              color: Color(0xFF808080),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: viewModel.blogContentController,
          maxLines: 5,
          decoration: InputDecoration(
              hintText: 'พิมพ์ข้อความ...',
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.normal,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF000000))),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              filled: true,
              fillColor: Colors.white),
          onChanged: viewModel.oChangeContent,
        ),
      ],
    );
  }
}

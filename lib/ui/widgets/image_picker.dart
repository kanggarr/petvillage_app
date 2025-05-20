import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(List<File>) onImagesChanged;

  const ImagePickerWidget({super.key, required this.onImagesChanged});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final List<File> _images = [];

  Future<void> _pickImages() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.image,   // เปิดแกลเลอรี
    withData: false,
  );

  if (result != null && result.files.isNotEmpty) {
    final allowed = ['.jpg', '.jpeg', '.png'];

    final validFiles = result.files.where((f) {
      final ext = f.extension != null ? '.${f.extension!.toLowerCase()}' : '';
      return allowed.contains(ext);
    }).toList();

    setState(() {
      _images.addAll(validFiles.map((f) => File(f.path!)));
    });
    widget.onImagesChanged(_images);
  }
}

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });

    widget.onImagesChanged(_images);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DottedBorder(
          color: const Color(0xFF808080),
          strokeWidth: 2,
          dashPattern: [6, 5],
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          child: GestureDetector(
            onTap: _pickImages,
            child: Container(
              height: 150,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo, size: 32, color: Color(0xFF808080)),
                  SizedBox(height: 8),
                  Text(
                    'แตะเพื่อเลือกรูปภาพ\nได้มากกว่าหนึ่งภาพ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (_images.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _images[index],
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.close, size: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
      ],
    );
  }
}

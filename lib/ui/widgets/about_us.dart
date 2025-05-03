import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'เกี่ยวกับเรา',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0xFF4F9451),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.4),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ]),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Pet Village (เพ็ท-วิลเลจ) คืออะไร?\n',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Kanit'),
                    ),
                    TextSpan(
                      text: 'What is Pet Village?',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Kanit'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
                'เพ็ท-วิลเลจ คือ แพลตฟอร์มที่เป็นพื้นที่การซื้อ-ขาย และรับเลี้ยงสัตว์ โดยเราจะเป็นตัวกลางให้ผู้ที่มาใช้แพลตฟอร์มเรา ได้อย่างปลอดภัย มีประสิทธิภาพ และสะดวกสบายในโลกออนไลน์')
          ],
        ),
      )),
    );
  }
}

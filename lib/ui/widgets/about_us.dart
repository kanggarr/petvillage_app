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
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
            const SizedBox(height: 20),
            const Text(
              'เพ็ท-วิลเลจ คือ แพลตฟอร์มที่เป็นพื้นที่การซื้อ-ขาย และรับเลี้ยงสัตว์ โดยเราจะเป็นตัวกลางให้ผู้ที่มาใช้แพลตฟอร์มเรา ได้อย่างปลอดภัย มีประสิทธิภาพ และสะดวกสบายในโลกออนไลน์',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/about_us.png'),
            const SizedBox(height: 18),
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
                child: const Center(
                  child: Text('เราดีกว่าอย่างไร?',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500)),
                )),
            const SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      Image.asset('assets/images/home.png', width: 80),
                      const SizedBox(height: 8),
                      const Text(
                        'หาบ้านให้สัตว์เลี้ยง',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'หาบ้านใหม่ให้กับสัตว์เลี้ยงที่คุณรัก',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      Image.asset('assets/images/free.png', width: 80),
                      const SizedBox(height: 8),
                      const Text(
                        'ลงขายฟรี',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      Image.asset('assets/images/chat.png', width: 80),
                      const SizedBox(height: 8),
                      const Text(
                        'ระบบแชท',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'คุยกับผู้ซื้อหรือผู้ขายได้ทันที',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
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
                child: const Center(
                  child: Text(
                      'จุดหมายปลายทางของทุกชีวิต ที่จะมีที่อยู่อาศัยและการดูแลที่ดี',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500)),
                )),
            const SizedBox(height: 20),
            const Text(
              'ตั้งแต่การรับเลี้ยงจนถึงการซื้อขายสัตว์ เราจะมอบประสบการณ์ที่อบอุ่นและมีปฏิสัมพันธ์ ที่มากกว่า การซื้อขายแบบเดิม เราสร้างชุมชนที่ผู้คนและสัตว์เลี้ยงได้พบเจอกันด้วย ความห่วงใย ความเข้าใจ และความสุขที่แท้จริง',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      )),
    );
  }
}

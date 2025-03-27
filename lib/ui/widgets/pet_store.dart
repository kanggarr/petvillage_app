import 'package:flutter/material.dart';

class PetStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                      'assets/images/profile.png'), // TODO: เปลี่ยนเป็นภาพร้านค้า
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Pets store01',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4F9451),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('เข้าชมร้านค้า',
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoText(label: 'โพสต์ลงขาย', value: '15 โพสต์'),
                _InfoText(label: 'อัตราการตอบกลับ', value: '85 %'),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoText(label: 'รายการโปรด', value: '131 หัวใจ'),
                _InfoText(label: 'ปิดการขาย', value: '6 ครั้ง'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  final String label;
  final String value;

  const _InfoText({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF000000)),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, color: Color(0xFF000000)),
        ),
      ],
    );
  }
}

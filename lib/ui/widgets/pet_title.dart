import 'package:flutter/material.dart';

class PetTitle extends StatelessWidget {
  const PetTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // หัวข้อประกาศ
        const Text(
          "ต้องการหาผู้เมตตาอุปการะ น้องสุนัข",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),

        // ไอคอน + ที่อยู่
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: Colors.black54),
            const SizedBox(width: 4),
            const Text(
              "เมืองเชียงใหม่, เชียงใหม่",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const Spacer(),
            // ปุ่ม "ส่งฟรีทั่วประเทศ"
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.local_shipping,
                  size: 16, color: Colors.white),
              label: const Text(
                "ส่งฟรีทั่วประเทศ",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F9451),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // ราคา
        const Text.rich(
          TextSpan(
            text: "ราคา ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "รับเลี้ยง",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              TextSpan(text: " บาท"),
            ],
          ),
        ),
      ],
    );
  }
}

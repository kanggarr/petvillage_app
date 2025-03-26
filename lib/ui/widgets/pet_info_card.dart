import 'package:flutter/material.dart';

class PetInfoCard extends StatelessWidget {
  const PetInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            // TODO: เชื่อม database
            const Text(
              "ข้อมูลโดยรวม :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // TODO: เชื่อม database
            const Text(
              "หมูเป็นเด็กตัวอาจจะไม่เล็กแต่ใจหมูน่ังนุ่มมากค่ะ..."
              "หากคุณสนใจที่จะรับเลี้ยง กรุณาติดต่อเราได้นะคะ",
            ),
            const SizedBox(height: 12),

            // TODO: เชื่อม database
            _buildInfoRow("สายพันธุ์", "Great Pyrenees"),
            const SizedBox(height: 12),
            _buildInfoRow("เพศ", "ผู้"),
            const SizedBox(height: 12),
            _buildInfoRow("อายุ", "1 ปี"),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันช่วยสร้างข้อมูลแสดงผลเป็นแถว
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: RichText(
        text: TextSpan(
          text: "$title : ",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF000000)),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

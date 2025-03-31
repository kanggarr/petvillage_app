import 'package:flutter/material.dart';

class PetDelivery extends StatelessWidget {
  final List<String> methods = [
    'นัดรับ',
    'ร้านส่งเอง',
    'รับหน้าร้าน',
    'เครื่องบิน',
    'รถส่งสัตว์เลี้ยง'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'วิธีการจัดส่ง',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  methods.map((method) => _buildMethodChip(method)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodChip(String method) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF4F9451),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        method,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

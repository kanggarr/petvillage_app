import 'package:flutter/material.dart';

class PetStore extends StatelessWidget {
  final void Function()? onPressed;
  const PetStore({Key? key, this.onPressed}) : super(key: key);

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
                      'assets/images/shop_profile.png'), // TODO: เชื่อมกับ API
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    // TODO: เชื่อมกับ API
                    'pet_shop',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F9451),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'เข้าชมร้านค้า',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 12),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     // TODO: เชื่อมกับ API
            //     _InfoText(label: 'โพสต์ลงขาย', value: '15 โพสต์'),
            //     _InfoText(label: 'อัตราการตอบกลับ', value: '85 %'),
            //   ],
            // ),
            // const SizedBox(height: 8),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     // TODO: เชื่อมกับ API
            //     _InfoText(label: 'รายการโปรด', value: '131 หัวใจ'),
            //     _InfoText(label: 'ปิดการขาย', value: '6 ครั้ง'),
            //   ],
            // ),
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

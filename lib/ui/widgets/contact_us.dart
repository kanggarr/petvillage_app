import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ติดต่อเรา',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF4F9451), width: 3),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.4),
                          blurRadius: 4,
                          offset: const Offset(0, 2))
                    ]),
                alignment: Alignment.center,
                child: const Text(
                  'ส่งอีเมลไปที่  contact@pet_village.com',
                  style: TextStyle(
                    color: Color(0xFF4F9451),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'ข้อมูลติดต่อ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F9451)),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Color(0xFF4F9451)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '110 ถนนประชาอุทิศ แขวงบางมด เขตทุ่งครุ กรุงเทพมหานคร 10140',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Icon(Icons.phone_android, color: Color(0xFF4F9451)),
                  SizedBox(width: 12),
                  Text('+66 65-339-4200', style: TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Icon(Icons.email, color: Color(0xFF4F9451)),
                  SizedBox(width: 12),
                  Text('contact@pet_village.com',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Icon(Icons.access_time, color: Color(0xFF4F9451)),
                  SizedBox(width: 12),
                  Text('จันทร์ - อาทิตย์: 9:00 - 18:00',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
              const Spacer(),
              const Text('version 1.1.2',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

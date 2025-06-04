import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/views/login/login_view.dart';
import 'package:petvillage_app/ui/views/register/register_view.dart';
import 'package:petvillage_app/ui/views/shop_register/shop_register_view.dart';

class AuthSelector extends StatefulWidget {
  const AuthSelector({super.key});

  @override
  State<AuthSelector> createState() => _AuthSelectorState();
}

class _AuthSelectorState extends State<AuthSelector> {
  bool isRegisterSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Column(
                children: [
                  Text(
                    'Pet Village',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F9451),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isRegisterSelected = true),
                    child: Column(
                      children: [
                        Text(
                          'ลงทะเบียนผู้ใช้ทั่วไป',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: isRegisterSelected
                                ? const Color(0xFF000000)
                                : const Color(0xFF808080),
                          ),
                        ),
                        if (isRegisterSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 60,
                            color: const Color(0xFF4F9451),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () => setState(() => isRegisterSelected = false),
                    child: Column(
                      children: [
                        Text(
                          'ลงทะเบียนร้านค้า',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: !isRegisterSelected
                                ? const Color(0xFF000000)
                                : const Color(0xFF808080),
                          ),
                        ),
                        if (!isRegisterSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 60,
                            color: const Color(0xFF4F9451),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F9451),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    if (isRegisterSelected) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopRegisterView()),
                      );
                    }
                  },
                  child: Text(
                    isRegisterSelected ? 'ลงทะเบียน' : 'ลงทะเบียน',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'มีบัญชีอยู่แล้วใช่ไหม? ',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Kanit'),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            print('กดลงชื่อเข้าใช้แล้ว');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()),
                            );
                          },
                          child: const Text(
                            'ลงชื่อเข้าใช้',
                            style: TextStyle(
                              color: Color(0xFF4F9451),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF4F9451),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

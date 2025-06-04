import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petvillage_app/ui/common/assets.dart';

class RegisterStoreButton extends StatelessWidget {
  final VoidCallback onTap;

  const RegisterStoreButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.2),
              offset: const Offset(2, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.assetsIconsShopIcon, width: 24, height: 24),
            const SizedBox(width: 8),
            const Text(
              "ลงทะเบียนร้านค้า",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

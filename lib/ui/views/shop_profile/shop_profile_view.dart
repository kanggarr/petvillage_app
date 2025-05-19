import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'shop_profile_viewmodel.dart';

class ShopProfileView extends StackedView<ShopProfileViewModel> {
  const ShopProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShopProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
        ),
        body: const SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ร้านค้า',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424)),
              ),
              SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(
                        'assets/images/shop_profile.png'), // เปลี่ยนเป็น NetworkImage ถ้าจาก url
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Pets store01',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: 18, color: Colors.black54),
                            SizedBox(width: 4),
                            Text(
                              'เมืองเชียงใหม่, เชียงใหม่',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }

  @override
  ShopProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShopProfileViewModel();
}

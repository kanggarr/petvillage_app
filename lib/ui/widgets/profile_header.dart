import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/profile_register_store.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          // backgroundImage: AssetImage(''),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Smith Brown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "smith1234@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            RegisterStoreButton(
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

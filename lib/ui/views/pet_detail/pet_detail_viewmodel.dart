import 'package:flutter/material.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:petvillage_app/services/favorite_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// class PetDetailViewModel extends BaseViewModel {
//   final _navigationService = locator<NavigationService>();
//   final _favoriteService = FavoriteService();

//   void navigateToShopProfile() {
//     _navigationService.navigateToShopProfileView();
//   }

//   Future<void> toggleFavorite({
//     required String petId,
//     required BuildContext context,
//   }) async {
//     print('🟢 เริ่ม toggleFavorite สำหรับ petId: $petId');
//     try {
//       await _favoriteService.addToFavorite(petId: petId);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('เพิ่มในรายการโปรดแล้ว'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       print('❌ เกิดข้อผิดพลาดในการเพิ่มรายการโปรด: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('❌ ไม่สามารถเพิ่มรายการโปรดได้: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }

class PetDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _favoriteService = FavoriteService();

  bool isFavorite = false;

  void navigateToShopProfile() {
    _navigationService.navigateToShopProfileView();
  }

  Future<void> toggleFavorite({
    required String petId,
    required BuildContext context,
  }) async {
    print('🟢 toggleFavorite petId: $petId');
    try {
      if (isFavorite) {
        await _favoriteService.removeFromFavorite(petId: petId);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('ลบออกจากรายการโปรดแล้ว'),
        //     backgroundColor: Colors.red,
        //   ),
        // );
        isFavorite = false;
      } else {
        await _favoriteService.addToFavorite(petId: petId);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('เพิ่มในรายการโปรดแล้ว'),
        //     backgroundColor: Colors.green,
        //   ),
        // );
        isFavorite = true;
      }
      notifyListeners(); // 🔄 เพื่ออัปเดต UI
    } catch (e) {
      print('❌ toggleFavorite error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('เกิดข้อผิดพลาด: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

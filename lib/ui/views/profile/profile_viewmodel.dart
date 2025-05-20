import 'package:stacked/stacked.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:petvillage_app/services/profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _profileService = locator<ProfileService>();

  String _username = '';
  String _email = '';

  String get username => _username;
  String get email => _email;

  Future<void> loadUserProfile() async {
    setBusy(true);

    final result = await _profileService.fetchUserProfile();
    if (result != null) {
      _username = result['username'] ?? 'ไม่พบชื่อผู้ใช้';
      _email = result['email'] ?? 'ไม่พบอีเมล';
    } else {
      _username = 'ไม่พบชื่อผู้ใช้';
      _email = 'ไม่พบอีเมล';
    }

    setBusy(false);
    notifyListeners();
  }

  void navigateToEditProfile() {
    _navigationService.navigateToProfileEditView();
  }

  void navigateToFavorite() {
    _navigationService.navigateToFavoriteView();
  }

  Future<void> logout() async {
    var result = await _dialogService.showConfirmationDialog(
      title: 'ยืนยัน',
      description: 'คุณต้องการออกจากระบบใช่หรือไม่?',
      confirmationTitle: 'ใช่',
      cancelTitle: 'ยกเลิก',
    );

    if (result?.confirmed == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}


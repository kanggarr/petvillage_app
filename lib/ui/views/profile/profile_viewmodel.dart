import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:petvillage_app/services/profile_service.dart';


class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _profileService = locator<ProfileService>();

  String _username = '';
  String get username => _username;

  Future<void> init() async {
    setBusy(true);
    _username = await _profileService.fetchUsername() ?? 'ไม่ทราบชื่อ';
    setBusy(false);
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
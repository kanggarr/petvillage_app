import 'package:petvillage_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeFilterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future navigatetoHome() async {
    _navigationService.back();
  }
}

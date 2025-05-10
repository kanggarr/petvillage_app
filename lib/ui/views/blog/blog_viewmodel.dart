import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BlogViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToBlogDetail() {
    _navigationService.navigateToBlogDetailView();
  }
}

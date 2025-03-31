import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashPage1ViewModel extends BaseViewModel {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  final _navigationService = locator<NavigationService>();

  final List<String> titles = [
    'ซื้อ-ขายสัตว์ที่สะดวกปลอดภัย?',
    'สัตว์เลี้ยงที่หลากหลาย?',
    'พบสัตว์เลี้ยง?',
    'ต้องการบ้านให้สัตว์เลี้ยง?'
  ];

  final List<String> descriptions = [
    'ใช้แอปพลิเคชันของเราเพื่อซื้อ-ขายสัตว์เลี้ยงที่สะดวกและปลอดภัย โดยมีการตรวจสอบยืนยันตัวตนของผู้ขายพร้อมทั้งมีแบบทดสอบสำหรับผู้ซื้อ เพื่อให้มั่นใจว่าสัตว์เลี้ยงจะไม่ถูกทิ้ง',
    'ใช้แอปพลิเคชั่นของเราเพื่อเลือกซื้อสัตว์เลี้ยงตามสายพันธุ์ที่คุณต้องการ',
    'ใช้แอปพลิเคชั่นของเราเพื่อโพสต์โฆษณา ‘พบสัตว์เลี้ยง’ และเป็นฮีโร่ในการพาสัตว์เลี้ยงกลับมาหาเจ้าของ!!',
    'แอปพลิเคชั่นของเราเชื่อมต่อคุณกับผู้รับเลี้ยงที่เอาใจใส่เพื่อให้แน่ใจว่าสัตว์เลี้ยงจะได้บ้านอย่างถาวร'
  ];

  void nextPage() {
    if (_currentPage < 3) {
      _currentPage++;
      notifyListeners();
    } else {
      _currentPage = 0;
      _navigationService.navigateToLoginView();
    }
  }

  String getTitle() => titles[_currentPage];
  String getDescription() => descriptions[_currentPage];
}

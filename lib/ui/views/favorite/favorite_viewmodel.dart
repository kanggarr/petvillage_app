import 'package:stacked/stacked.dart';

class FavoriteViewModel extends BaseViewModel {
  List<Map<String, dynamic>> favorites = [
    {
      'id': '1',
      'imageUrl': 'assets/images/dog.png',
      'name': 'Scottish Fold Cat',
      'age': '2 เดือน',
      'description': 'Scottish Fold หูตั้ง เลี้ยงง่าย ขี้อ้อน ขี้เล่น กินเก่ง',
      'gender': 'ผู้',
      'price': '12,000',
    },
    {
      'id': '2',
      'imageUrl': 'assets/images/dog.png',
      'name': 'Labrador Retriever',
      'age': '3 เดือน',
      'description': 'สุนัขพันธุ์ใหญ่ ขี้เล่น ฉลาด เหมาะกับเด็ก',
      'gender': 'ผู้',
      'price': '20,000',
    },
  ];

  void removeFavorite(String id) {
    favorites.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }
}

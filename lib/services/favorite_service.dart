import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petvillage_app/services/token_service.dart';

class FavoriteService {
  final _tokenService = TokenService();

  Future<void> addToFavorite({required String petId}) async {
    final token = await _tokenService.getToken();

    if (token == null) {
      print('❌ ไม่พบ Token');
      throw Exception('No token found');
    }

    final url = Uri.parse('https://your-api-url.com/api/favorite'); // ✅ เปลี่ยนให้ตรง
    print('📡 เรียก POST ไปยัง: $url ด้วย petId: $petId');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'petId': petId}), // ✅ ชื่อ key ต้องตรงกับ backend
    );

    print('📥 Response: ${response.statusCode} ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('✅ เพิ่มรายการโปรดสำเร็จ');
    } else {
      throw Exception('เพิ่มรายการโปรดไม่สำเร็จ: ${response.body}');
    }
  }
}

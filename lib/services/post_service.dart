import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:path/path.dart' as p;

class PostService {
  Future<http.StreamedResponse> postBlog(
      String title, String description, List<File> images) async {
    String endpoint = 'blog/create';
    final uri = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/$endpoint'
          : '${dotenv.env['API_IOS_URL']}api/$endpoint',
    );

    try {
      final request = http.MultipartRequest('POST', uri)
        ..fields['title_name'] = title
        ..fields['description'] = description;

      for (final img in images) {
        final ext = p.extension(img.path).toLowerCase();
        late final MediaType media;

        switch (ext) {
          case '.jpg':
          case '.jpeg':
            media = MediaType('image', 'jpeg');
            break;
          case '.png':
            media = MediaType('image', 'png');
            break;
          default:
            throw Exception('ไม่รองรับไฟล์ $ext');
        }

        request.files.add(await http.MultipartFile.fromPath(
          'images',
          img.path,
          contentType: media, // ระบุ MIME-type ชัด ๆ
        ));
      }
      return await request.send();
    } catch (error) {
      print("postBlog error => ${error.toString()}");
      rethrow;
    }
  }

  Future<http.StreamedResponse> postPet(
      String petName,
      String petType,
      String petBreed,
      String gender,
      String age,
      String description,
      String price,
      bool isAdopt,
      String address,
      String province,
      String district,
      String subDistrict,
      String shipping,
      List<File> images
      ) async {
    String endpoint = 'pet/pets';

    final uri = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/$endpoint'
          : '${dotenv.env['API_IOS_URL']}api/$endpoint',
    );

    try {
      final request = http.MultipartRequest('POST', uri)
        ..fields['pet_name'] = petName
        ..fields['pet_type'] = petType
        ..fields['pet_breed'] = petBreed
        ..fields['pet_gender'] = gender
        ..fields['pet_age'] = age.toString()
        ..fields['pet_description'] = description
        ..fields['pet_price'] = price.toString()
        ..fields['pet_is_adoptable'] = isAdopt.toString()
        ..fields['pet_address'] = address
        ..fields['pet_province'] = province
        ..fields['pet_district'] = district
        ..fields['pet_subdistrict'] = subDistrict
        ..fields['pet_shipping'] = shipping;

      for (final img in images) {
        final ext = p.extension(img.path).toLowerCase();
        late final MediaType media;

        switch (ext) {
          case '.jpg':
          case '.jpeg':
            media = MediaType('image', 'jpeg');
            break;
          case '.png':
            media = MediaType('image', 'png');
            break;
          default:
            throw Exception('ไม่รองรับไฟล์ $ext');
        }

        request.files.add(await http.MultipartFile.fromPath(
          'pet_image',
          img.path,
          contentType: media, // ระบุ MIME-type ชัด ๆ
        ));
      }
      return await request.send();
    } catch (error) {
      print("postBlog error => ${error.toString()}");
      rethrow;
    }
  }
}

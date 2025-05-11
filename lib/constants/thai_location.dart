// lib/constants/thai_locations.dart

const List<String> provinces = ['กรุงเทพมหานคร'];

const Map<String, List<String>> districtsByProvince = {
  'กรุงเทพมหานคร': [
    'เขตบางกะปิ',
    'เขตห้วยขวาง',
    'เขตจตุจักร',
    'เขตบางเขน',
    'เขตคลองเตย',
    'เขตดอนเมือง',
    'เขตธนบุรี',
    'เขตดินแดง',
  ],
};

const Map<String, List<String>> subDistrictsByDistrict = {
  'เขตบางกะปิ': ['แขวงคลองจั่น', 'แขวงหัวหมาก'],
  'เขตห้วยขวาง': ['แขวงห้วยขวาง', 'แขวงบางกะปิ'],
  'เขตจตุจักร': ['แขวงจตุจักร', 'แขวงลาดยาว'],
  'เขตบางเขน': ['แขวงอนุสาวรีย์', 'แขวงท่าแร้ง'],
  'เขตคลองเตย': ['แขวงคลองตัน', 'แขวงพระโขนง'],
  'เขตดอนเมือง': ['แขวงดอนเมือง', 'แขวงสีกัน'],
  'เขตธนบุรี': ['แขวงดาวคะนอง', 'แขวงสำเหร่'],
  'เขตดินแดง': ['แขวงดินแดง'],
};

List<String> getDistricts(String province) {
  return districtsByProvince[province] ?? [];
}

List<String> getSubDistricts(String district) {
  return subDistrictsByDistrict[district] ?? [];
}

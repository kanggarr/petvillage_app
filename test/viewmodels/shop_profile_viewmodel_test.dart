import 'package:flutter_test/flutter_test.dart';
import 'package:petvillage_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ShopProfileViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

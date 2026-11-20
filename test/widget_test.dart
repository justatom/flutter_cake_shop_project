import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_cake_shop_project/data/cake_shop_data.dart';

void main() {
  test('has 7 cake shops with valid coordinates', () {
    expect(cakeShops.length, 7);
    for (final shop in cakeShops) {
      expect(double.tryParse(shop.latitude), isNotNull, reason: shop.name);
      expect(double.tryParse(shop.longitude), isNotNull, reason: shop.name);
    }
  });
}

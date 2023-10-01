// ignore_for_file: prefer_const_constructors

import 'package:api_repository/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiRepository', () {
    test('can be instantiated', () {
      expect(ApiRepository(), isNotNull);
    });
  });
}

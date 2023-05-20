import 'package:flutter_test/flutter_test.dart';
import 'package:squip/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SplashViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

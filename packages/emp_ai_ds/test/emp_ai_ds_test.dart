import 'package:flutter_test/flutter_test.dart';

import 'package:emp_ai_ds/emp_ai_ds.dart';

void main() {
  test('adds one to input values', () {
    expect(Calculator.addOne(2), 3);
    expect(Calculator.addOne(-7), -6);
    expect(Calculator.addOne(0), 1);
  });
}

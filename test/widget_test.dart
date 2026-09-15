import 'package:flutter_test/flutter_test.dart';
import 'package:zorbico/zorbico_app.dart';

void main() {
  testWidgets('ZorbicoApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ZorbicoApp());
    expect(find.byType(ZorbicoApp), findsOneWidget);
  });
}

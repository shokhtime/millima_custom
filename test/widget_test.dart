import 'package:crm_flutter/ui/screens/auth/register/register_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("My App test", (tester) async {
    tester.pumpWidget(MainText());
    expect(find.text("Milliyma"), findsOneWidget);
  });
}

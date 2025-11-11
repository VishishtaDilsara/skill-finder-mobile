import 'package:flutter_test/flutter_test.dart';
import 'package:skill_finder/main.dart';

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const SkillFinderApp());
    expect(find.text('Welcome to Skill Finder'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_shows_flutter_app/shared/search_field.dart';


void main() {
  setUpAll(() {});

  testWidgets(
    'Test MovieStream Builder',
    (WidgetTester tester) async {
      await tester.pumpWidget(
         SearchField(
            initialValue: 'jedan',
            hint: '5',
            onChanged: (val){},
          ),
        
      );

    },
  );
}
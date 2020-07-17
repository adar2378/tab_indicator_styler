import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tab_indicator_styler/src.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Basic Indicator Test', (WidgetTester tester) async {
    await binding.setSurfaceSize(const Size(800, 400));

    final Widget app = Builder(
      builder: (context) {
        return MaterialApp(
          theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.red,
            filled: true,
          )),
          home: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Builder(builder: (context) {
                return Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "Home",
                        ),
                        Tab(
                          text: "Work",
                        ),
                      ],
                      indicator: DotIndicator(),
                    ),
                    TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "Home",
                        ),
                        Tab(
                          text: "Work",
                        ),
                      ],
                      indicator: MaterialIndicator(),
                    ),
                    TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "Home",
                        ),
                        Tab(
                          text: "Work",
                        ),
                      ],
                      indicator: RectangularIndicator(),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('golden_test_1.png'),
    );
  });
}


/////////////////////////////////////////////////////////////////////////
///                                                                  ///
///   Check if package is correct if you change the package name    ///
///                                                                ///
/////////////////////////////////////////////////////////////////////



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/splash/splash_page.dart';

Future<void> main() async {
  setUp(() {});

  testWidgets('Verify', (WidgetTester tester) async {
    //Arrange - Pump MyApp() widget to tester
    await tester
        .pumpWidget(ProviderScope(child: MaterialApp(home: SplashPage())));

    final scafold = find.byKey(const Key('splash_page'));

    final text = find.text('Splash Page');

    expect(text, findsOneWidget);

    expect(scafold, findsOneWidget);

    await tester.pump();
  });
}

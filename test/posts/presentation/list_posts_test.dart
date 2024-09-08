
/////////////////////////////////////////////////////////////////////////
///                                                                  ///
///   Check if package is correct if you change the package name    ///
///                                                                ///
/////////////////////////////////////////////////////////////////////


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/postes/presentation/list_postes.dart';

Future<void> main() async {
  setUp(() {});

  testWidgets('🧪 Post List Screen', (WidgetTester tester) async {
    await tester.runAsync(() async {
      
      await tester.pumpWidget(
          ProviderScope(child: MaterialApp(home: PostsListScreen())));

      final scafold = find.byKey(const Key('post_list_scaffold'));
      final fab = find.byType(FloatingActionButton);

      expect(scafold, findsOneWidget);
      expect(fab, findsOneWidget);

      await tester.tap(fab);

      await tester.pump();
    });
  });
}

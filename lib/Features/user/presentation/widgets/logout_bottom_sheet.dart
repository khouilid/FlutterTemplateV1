import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/auth/shared/providers.dart';
import 'package:template/core/presentation/utils/buttons/action_buttons.dart';

class LogOutBottomSheet extends ConsumerWidget {
  const LogOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Logout",
            style: TextStyle(
                color: Color(0xffEB4D3D),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Are you sure you want to logout?",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 20,
          ),
          ActionButton(
            width: MediaQuery.of(context).size.width,
            onPressed: () {
              context.router.pop();
            },
            color: Theme.of(context).colorScheme.primary,
            action: "Cancel",
            child: Text(
              "Cancel",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ActionButton(
            width: MediaQuery.of(context).size.width,
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
            color: Colors.black,
            action: "Yes, Logout",
            child: Text(
              "Yes, Logout",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

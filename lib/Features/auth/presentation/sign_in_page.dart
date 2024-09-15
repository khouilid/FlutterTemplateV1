import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/auth/application/auth_notifier.dart';
import 'package:template/Features/auth/shared/providers.dart';
import 'package:template/core/presentation/utils/buttons/action_buttons.dart';
import 'package:template/core/presentation/utils/textformfiles/email_textformfield.dart';
import 'package:template/core/presentation/utils/textformfiles/password_textformfield.dart';
import 'package:template/core/presentation/utils/toast/flash_messages.dart';
import 'package:template/gen/assets.gen.dart';

final Uri url = Uri.parse('https://privacy.html');

@RoutePage()
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    final AuthState authState = ref.watch(authNotifierProvider);

    Future<void> signIn(String phone, String password) async {
      if (phone.isNotEmpty && password.isNotEmpty)
        await ref.read(authNotifierProvider.notifier).signIn(phone, password);
      else {
        showToast(
            context: context,
            message: "Please fill all fields",
            severity: Severity.error);
        return;
      }
    }

    ref.listen(authNotifierProvider, (_, next) {
      next.maybeMap(
          orElse: () {},
          failure: (_) {
            showToast(
                context: context,
                message: _.failure.message ?? "Error",
                severity: Severity.error);
          });
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 30,
                ),
                EmailTextFormField(
                  hintText: "Email",
                  controller: phoneController,
                  readOnly: authState.maybeMap(
                    orElse: () => false,
                    loading: (_) => true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                PasswordTextFormField(
                  hintText: "Password",
                  controller: passwordController,
                  onEditingComplete: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await signIn(
                      phoneController.text,
                      passwordController.text,
                    );
                  },
                  readOnly: authState.maybeMap(
                    orElse: () => false,
                    loading: (_) => true,
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ActionButton(
                  color: Theme.of(context).colorScheme.primary,
                  action: "Sign In",
                  width: MediaQuery.of(context).size.width,
                  onPressed: () => authState.maybeMap(
                    orElse: () {
                      signIn(
                        phoneController.text,
                        passwordController.text,
                      );
                      return null;
                    },
                  ),
                  child: authState.maybeMap(
                      orElse: () => Text("Sign In",
                          style: TextStyle(color: Colors.white)),
                      loading: (_) {
                        return Center(
                            child: const CircularProgressIndicator(
                          color: Colors.white,
                        ));
                      }),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

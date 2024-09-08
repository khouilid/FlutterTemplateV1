import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:template/core/presentation/utils/bottom_sheet_model.dart';
import 'package:template/Features/user/presentation/widgets/language_bottom_sheet.dart';
import 'package:template/Features/user/shared/user_providers.dart';

import 'widgets/logout_bottom_sheet.dart';

@RoutePage()
class UserPage extends ConsumerWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffEDF0F2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 17,
                      ))),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              ref.watch(userProvider).firstName +
                  " " +
                  ref.watch(userProvider).lastName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              ProfileListeTileInfo(
                                colorIcon: Color(0xff2B9B6E),
                                icon: Icon(Icons.settings),
                                onPressed: () {
                                  Logger().d("profileSettings");
                                },
                                title: "Profile Settings",
                              ),
                              Divider(
                                color: Color(0xffC0B9C3),
                              ),
                              ProfileListeTileInfo(
                                colorIcon: Color(0xffEB4D3D),
                                icon: Icon(Icons.settings),
                                onPressed: () {
                                  Logger().d("proinfo");
                                },
                                title: "Profile Information",
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              ProfileListeTileInfo(
                                colorIcon: Color(0xff3478F6),
                                icon: Icon(Icons.settings),
                                onPressed: () => openCustoumButtomSheet(
                                  context,
                                  child: LanguageBottomSheet(),
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 3,
                                  minHeight:
                                      MediaQuery.of(context).size.height / 3,
                                ),
                                title: "Language",
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () => openCustoumButtomSheet(
                        context,
                        child: LogOutBottomSheet(),
                        maxHeight: MediaQuery.of(context).size.height / 3,
                        minHeight: MediaQuery.of(context).size.height / 3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Log Out",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ProfileListeTileInfo extends StatelessWidget {
  final Color colorIcon;
  final Widget icon;
  final void Function() onPressed;
  final String title;

  const ProfileListeTileInfo(
      {super.key,
      required this.colorIcon,
      required this.icon,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: colorIcon,
            child: icon,
          ),
          SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}

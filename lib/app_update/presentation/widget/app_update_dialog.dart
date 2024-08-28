import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/app_update_status_model.dart';

Future showDialogCustomBody(
  BuildContext context,
  Widget child,
) async =>
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Colors.white,
              children: [child],
            ));

Future updateDialog(
  BuildContext context,
  AppUpdateStatusModel appUpdateStatusModel,
) {
  return showDialogCustomBody(
    context,
    SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      // height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Nouvelle version disponible",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(appUpdateStatusModel.description,
                style: Theme.of(context).textTheme.bodyMedium),
            // const Spacer(),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton(
                    child: const SizedBox(
                      width: 100,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Mettre à jour",
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);

                      if (appUpdateStatusModel.platform ==
                          Platform.operatingSystem) {
                        launchUrl(Uri.parse("${appUpdateStatusModel.appLink}"),
                            mode: LaunchMode.externalApplication);
                        return;
                      }
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text(
                      "Plus tard",
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
 


@RoutePage()
class AppUpdateRequiredPage extends StatelessWidget {
  const AppUpdateRequiredPage({
    super.key,
    required this.appUpdateStatusModel,
  });

  final AppUpdateStatusModel appUpdateStatusModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const Spacer(),
          const SizedBox(height: 30),
          const Text(
            "Nouvelle version disponible",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Veuillez mettre à jour votre application pour continuer à l'utiliser.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appUpdateStatusModel.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            child: const SizedBox(
              width: 100,
              height: 50,
              child: Center(
                child: Text(
                  "Mettre à jour",
                ),
              ),
            ),
            onPressed: () 
            {

              if (appUpdateStatusModel.platform == Platform.operatingSystem) {
                launchUrl(Uri.parse("${appUpdateStatusModel.appLink}"),
                    mode: LaunchMode.externalApplication);
                return;
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    ));
  }
}

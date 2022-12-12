import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDialogsCollection {
  static const _googleServiceLink =
      'https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox&hl=ru&gl=US';
  static Future<void> noGoogleAppDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black45,
            content: const Text('Make sure you have Google app.'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(
                          Icons.store,
                          color: Colors.green,
                        ),
                        onPressed: () async => await launchUrl(
                          Uri.parse(_googleServiceLink),
                        ),
                      ),
                      const Text('Download')
                    ],
                  ),
                  //add dialog on something else
                  Column(
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                        onPressed: () => displaySnackbar(
                          message: 'try restart app, or reboot your phone',
                          context: context,
                        ),
                      ),
                      const Text('I am still got error!'),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      displaySnackbar({
    required BuildContext context,
    required String message,
    int milliseconds = 2000,
  }) {
    FocusScope.of(context).unfocus();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.only(bottom: 600),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black.withOpacity(0.8),
          ),
          child: Center(
            child: Text(
              message,
              maxLines: null,
            ),
          ),
        ),
        duration: Duration(milliseconds: milliseconds),
      ),
    );
  }
}

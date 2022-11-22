import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class CustomDialogsCollection {
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
                          onPressed: () => launch(
                              'https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox&hl=ru&gl=US')),
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
                          onPressed: () {
                            showCustomSnackBar(
                                'try restart app, or reboot your phone');
                          }),
                      const Text('I am still got error!'),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  static SnackBar showCustomSnackBar(String message) {
    return SnackBar(
      content: Container(
        child: Text(message),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          ),
        ),
      ),
      duration: const Duration(seconds: 2),
    );
  }
}

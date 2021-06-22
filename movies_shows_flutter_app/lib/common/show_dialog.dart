import 'package:flutter/material.dart';
import 'package:movies_shows_flutter_app/common/context.dart';

  
void _onAnnouncementsLoadingError() {
    showAlertDialog(
        ('Can\'t load announcements'),
        (
            'There was an error while loading announcements. Please try again later.'));
  }


Future<void> showAlertDialog(String title, String message) {
  return showDialog(
    context: getCurrentContext(),
    builder: (ctx) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text(
                ('OK'),
              ),
            ),
          ],
        ),
      );
    },
  );
}






import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
              backgroundColor: Colors.black54,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                      backgroundColor: Colors.white54,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please Wait....",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                )
              ]);
        });
  }

 static Widget showCircularProgress(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Loading....'),
            )
          ],
        ),
      );
}

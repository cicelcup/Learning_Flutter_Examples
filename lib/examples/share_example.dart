import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareExample extends StatelessWidget {
  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(),
          RaisedButton(
            onPressed: () {
              Share.share('Prueba');
            },
            child: Text("Send using share platform"),
          ),
          SizedBox(
            height: 16.0,
          ),
          RaisedButton(
            onPressed: () {
              launchWhatsApp(
                  phone: "+50683454273", message: "Extremadamente demasiado");
            },
            child: Text("Send direct to whatsapp"),
          ),
        ],
      ),
    );
  }
}

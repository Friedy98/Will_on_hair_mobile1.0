
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget{
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateTo("Texaco Omnisport");
    Future.delayed(Duration(seconds: 2),(){Navigator.pop(context);});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[300],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Center(
          child: Text("Un moment...")
      ),
    );
  }

  void navigateTo(String address) async{
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
    final Uri _url = Uri.parse(googleUrl);

    await launchUrl(_url,mode: LaunchMode.platformDefault);
  }
}
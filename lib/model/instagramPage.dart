
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramPage extends StatefulWidget{
  const InstagramPage({Key? key}) : super(key: key);

  @override
  _InstagramPageState createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    launchInstagram();
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

  void launchInstagram() async{
    const url = "https://instagram.com/will_on_hair?igshid=YmMyMTA2M2Y=";
    final Uri _url = Uri.parse(url);

    await launchUrl(_url,mode: LaunchMode.platformDefault);
  }
  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
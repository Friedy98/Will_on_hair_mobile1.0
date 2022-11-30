import 'package:flutter/material.dart';

class AppHeaderGradient extends StatelessWidget {
  const AppHeaderGradient(
      {this.text, this.isProfile, this.fixedHeight, Key? key})
      : super(key: key);
  final String? text;
  final bool? isProfile;
  final double? fixedHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: fixedHeight ?? 220,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.white],
              stops: [0, 1],
              end: Alignment.topRight,
              begin: Alignment.bottomLeft),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: isProfile!
                ? Radius.circular(150.0)
                : Radius.circular(250.0),
          ),
        ),
        child: isProfile!
            ? _buildProfileInfo(context)
            : Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 34),
                  child: Text(
                    text!,
                  ),
                ),
              ));
  }

  Widget _buildProfileInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 40.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: const AssetImage('assets/product/profile.png'),
          ),
          SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Oleh Chabanov'
              ),
              Text(
                '+38 (099) 123 45 67'
              ),
            ],
          ),
        ],
      ),
    );
  }
}

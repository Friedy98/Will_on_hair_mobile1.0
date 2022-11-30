import 'package:flutter/material.dart';

import '../../Animation_Services/delayed_animation.dart';
import '../../hotel_booking/hotel_app_theme.dart';

class ConfirmReservation extends StatefulWidget {
  final AnimationController animationController;
  const ConfirmReservation({Key? key, required this.animationController})
      : super(key: key);

  @override
  _ConfirmReservationState createState() => _ConfirmReservationState();
}

class _ConfirmReservationState extends State<ConfirmReservation> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _welcomeFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _welcomeImageAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
                child: DelayedAnimation(
                  delay: 500,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){

                    },
                    child: Container(
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/240_F_216040804_7KrvZbbeILJH5okMQAkHv3kTZg3n5lH2.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(4, 4),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(),
                                Container(
                                  color: HotelAppTheme.buildLightTheme()
                                      .backgroundColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, top: 8, bottom: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SlideTransition(
                                                  position: _welcomeFirstHalfAnimation,
                                                  child: Text(
                                                    "Info De Réservation",
                                                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(height: 20),
                                                RichText(
                                                  text: TextSpan(
                                                    style:DefaultTextStyle.of(context).style,
                                                    children: <TextSpan>[
                                                      TextSpan(text: "DATE:",
                                                          style: TextStyle(fontSize: 16,
                                                              color: Colors.grey
                                                                  .withOpacity(0.8))),
                                                      TextSpan(text: " Wednesday, 22/10/2022",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20,
                                                        ),),
                                                    ],

                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                RichText(
                                                  text: TextSpan(
                                                    style:DefaultTextStyle.of(context).style,
                                                    children: <TextSpan>[
                                                      TextSpan(text: "TEMPS:",
                                                          style: TextStyle(fontSize: 16,
                                                              color: Colors.grey
                                                                  .withOpacity(0.8))),
                                                      TextSpan(text: " 10:30",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20,
                                                        ),),
                                                    ],

                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                RichText(
                                                  text: TextSpan(
                                                    style:DefaultTextStyle.of(context).style,
                                                    children: <TextSpan>[
                                                      TextSpan(text: "AGENT:",
                                                          style: TextStyle(fontSize: 16,
                                                              color: Colors.grey
                                                                  .withOpacity(0.8))),
                                                      TextSpan(text: " William",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20,
                                                        ),),
                                                    ],

                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                RichText(
                                                  text: TextSpan(
                                                    style:DefaultTextStyle.of(context).style,
                                                    children: <TextSpan>[
                                                      TextSpan(text: "SERVICE:",
                                                          style: TextStyle(fontSize: 16,
                                                              color: Colors.grey
                                                                  .withOpacity(0.8))),
                                                      TextSpan(text: " Coupe Adults de 17 ans et plus",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20,
                                                        ),),
                                                    ],

                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Divider(
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(height: 10),
                                                RichText(
                                                  text: TextSpan(
                                                    style:DefaultTextStyle.of(context).style,
                                                    children: <TextSpan>[
                                                      TextSpan(text: "VOTRE CONTACT:",
                                                          style: TextStyle(fontSize: 16,
                                                              color: Colors.grey
                                                                  .withOpacity(0.8))),
                                                      TextSpan(text: " 032556787965",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16, top: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              '15€',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                  Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: _welcomeFirstHalfAnimation,
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "Vérifiez les informations de votre réservation, vous pouvez revenir en arrière pour modifier ou confirmer. Merci de respecter l'heure et la date",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

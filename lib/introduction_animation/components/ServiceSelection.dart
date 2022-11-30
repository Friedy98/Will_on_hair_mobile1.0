import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'dart:io' as plateform;

import '../../Animation_Services/delayed_animation.dart';
import '../../hotel_booking/hotel_app_theme.dart';

class ServiceSelection extends StatefulWidget {
  final AnimationController animationController;

  const ServiceSelection({Key? key, required this.animationController})
      : super(key: key);

  @override
  _ServiceSelectionState createState() => _ServiceSelectionState();
}

class _ServiceSelectionState extends State<ServiceSelection> with TickerProviderStateMixin {

  AnimationController? animationController;
  bool loadPictures = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _introductionanimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DelayedAnimation(
              delay: 700,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Sélection de Service",
                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))
                ),
              ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DelayedAnimation(
                        delay: 300,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: (){
                            print("Coiffure enfants");
                            widget.animationController.animateTo(0.2);
                          },
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/240_F_265073366_wXcritZmlOMNsxq2DsgkiCJJeJ9p1eKo.jpeg"),
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
                                                      Text(
                                                        "Coupe Enfant",
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 22,
                                                        ),
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            "De 0 - 10 ans",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.grey
                                                                    .withOpacity(0.8)),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.only(top: 4),
                                                        child: Row(
                                                          children: <Widget>[
                                                            RatingBar(
                                                              initialRating: 4,
                                                              direction: Axis.horizontal,
                                                              allowHalfRating: true,
                                                              itemCount: 5,
                                                              itemSize: 24,
                                                              ratingWidget: RatingWidget(
                                                                full: Icon(
                                                                  Icons.star_rate_rounded,
                                                                  color: HotelAppTheme
                                                                      .buildLightTheme()
                                                                      .primaryColor,
                                                                ),
                                                                half: Icon(
                                                                  Icons.star_half_rounded,
                                                                  color: HotelAppTheme
                                                                      .buildLightTheme()
                                                                      .primaryColor,
                                                                ),
                                                                empty: Icon(
                                                                  Icons
                                                                      .star_border_rounded,
                                                                  color: HotelAppTheme
                                                                      .buildLightTheme()
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                              itemPadding:
                                                              EdgeInsets.zero,
                                                              onRatingUpdate: (rating) {
                                                                print(rating);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
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
                                                    '10€',
                                                    style: TextStyle(
                                                        fontSize: 20,
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
                      SizedBox(height: 15),
                      DelayedAnimation(
                          delay: 500,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              print("Coiffure Ados");
                              widget.animationController.animateTo(0.2);
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/240_F_265073366_wXcritZmlOMNsxq2DsgkiCJJeJ9p1eKo.jpeg"),
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
                                                        Text(
                                                          "Coupe Ados",
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 22,
                                                          ),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              "De 11 - 16 ans",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors.grey
                                                                      .withOpacity(0.8)),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(top: 4),
                                                          child: Row(
                                                            children: <Widget>[
                                                              RatingBar(
                                                                initialRating: 4,
                                                                direction: Axis.horizontal,
                                                                allowHalfRating: true,
                                                                itemCount: 5,
                                                                itemSize: 24,
                                                                ratingWidget: RatingWidget(
                                                                  full: Icon(
                                                                    Icons.star_rate_rounded,
                                                                    color: HotelAppTheme
                                                                        .buildLightTheme()
                                                                        .primaryColor,
                                                                  ),
                                                                  half: Icon(
                                                                    Icons.star_half_rounded,
                                                                    color: HotelAppTheme
                                                                        .buildLightTheme()
                                                                        .primaryColor,
                                                                  ),
                                                                  empty: Icon(
                                                                    Icons
                                                                        .star_border_rounded,
                                                                    color: HotelAppTheme
                                                                        .buildLightTheme()
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                                itemPadding:
                                                                EdgeInsets.zero,
                                                                onRatingUpdate: (rating) {
                                                                  print(rating);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
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
                                                      '13€',
                                                      style: TextStyle(
                                                          fontSize: 20,
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
                      SizedBox(height: 15),
                      DelayedAnimation(
                          delay: 700,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              print("Coiffure Adultes");
                              widget.animationController.animateTo(0.2);
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/240_F_265073366_wXcritZmlOMNsxq2DsgkiCJJeJ9p1eKo.jpeg"),
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
                                                        Text(
                                                          "Coupe Adultes",
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 22,
                                                          ),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              "17 ans et plus",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors.grey
                                                                      .withOpacity(0.8)),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(top: 4),
                                                          child: Row(
                                                            children: <Widget>[
                                                              RatingBar(
                                                                initialRating: 4,
                                                                direction: Axis.horizontal,
                                                                allowHalfRating: true,
                                                                itemCount: 5,
                                                                itemSize: 24,
                                                                ratingWidget: RatingWidget(
                                                                  full: Icon(
                                                                    Icons.star_rate_rounded,
                                                                    color: HotelAppTheme
                                                                        .buildLightTheme()
                                                                        .primaryColor,
                                                                  ),
                                                                  half: Icon(
                                                                    Icons.star_half_rounded,
                                                                    color: HotelAppTheme
                                                                        .buildLightTheme()
                                                                        .primaryColor,
                                                                  ),
                                                                  empty: Icon(
                                                                    Icons
                                                                        .star_border_rounded,
                                                                    color: HotelAppTheme
                                                                        .buildLightTheme()
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                                itemPadding:
                                                                EdgeInsets.zero,
                                                                onRatingUpdate: (rating) {
                                                                  print(rating);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
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
                                                          fontSize: 20,
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
                      )
                    ],
                  )
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38.0),
                  color: Color(0xff132137),
                ),
                child: Center(
                  child: Text(
                    "Annuler",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ),
            ),
          ),
        ],
      )
    );
  }
}

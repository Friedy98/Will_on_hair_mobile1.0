//import 'package:best_flutter_ui_templates/fitness_app/ui_view/area_list_view.dart';
//import 'package:best_flutter_ui_templates/fitness_app/ui_view/running_view.dart';
//import 'package:best_flutter_ui_templates/fitness_app/ui_view/title_view.dart';
//import 'package:best_flutter_ui_templates/fitness_app/ui_view/workout_view.dart';
import 'package:best_flutter_ui_templates/Animation_Services/delayed_animation.dart';
import 'package:flutter/material.dart';

import '../../Animation_Services/Another_animation.dart';
import '../../hotel_booking/hotel_app_theme.dart';
import '../fitness_app_theme.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    //addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  /*void addAllListData() {
    const int count = 5;

    listViews.add(
      TitleView(
        titleTxt: 'Your program',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      WorkoutView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );
    listViews.add(
      RunningView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Area of focus',
        subTxt: 'more',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      AreaListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 5, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );
  }*/

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            //getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return Column(
      children: [
        DelayedAnimation(delay: 300,
            child: Padding(
              padding: EdgeInsets.only(top: 50, bottom: 10),
              child: Center(
                child: Text("My Reservations", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),),
              ),
            ),
        ),

        Expanded(
            child: ListView.builder(
                itemCount: 3,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: widget.animationController!,
                      curve: Interval((1 / 3) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                          child: AnotherDelayedAnimation(delay: 500,
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
                                                            Text(
                                                              "Info De Réservation",
                                                              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
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
                              )
                          )
                      )
                    ],
                  );
                }
            )
        ),
        SizedBox(height: 70),
      ],
    );
  }

  /*Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Training',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: FitnessAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: FitnessAppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: FitnessAppTheme.grey,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    '15 May',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: FitnessAppTheme.darkerText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: FitnessAppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }*/
}

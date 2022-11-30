import 'dart:ui';

import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'model/homelist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  List containers = [
    GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/240_F_142999858_7EZ3JksoU3f4zly0MuY3uqoxhKdUwN5u.jpeg"),
            fit: BoxFit.contain,
          )
        ),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
    )
  ];
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          isLightMode == true ? Colors.transparent : AppTheme.nearlyBlack,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar(),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return GridView(
                            padding: const EdgeInsets.only(
                                top: 0, left: 12, right: 12),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: List<Widget>.generate(
                              homeList.length,
                              (int index) {
                                final int count = homeList.length;
                                final Animation<double> animation =
                                    Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn),
                                  ),
                                );
                                animationController?.forward();
                                return AnimatedBuilder(
                                  animation: animationController!,
                                  builder: (BuildContext context, Widget? child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: Transform(
                                        transform: Matrix4.translationValues(
                                            0.0, 50 * (1.0 - animation.value), 0.0),
                                        child: AspectRatio(
                                          aspectRatio: 1.5,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                            child: Stack(
                                              alignment: AlignmentDirectional.center,
                                              children: <Widget>[
                                                Positioned.fill(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.6),
                                                          offset: const Offset(4, 4),
                                                          blurRadius: 16,
                                                        ),
                                                      ],
                                                      image: DecorationImage(
                                                        image: AssetImage(homeList[index].imagePath),
                                                        fit: BoxFit.cover,
                                                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                                                      ),
                                                      borderRadius: BorderRadius.circular(15),

                                                      //border: Border.all(width: 3, color: Colors.grey)
                                                    ),
                                                  )
                                                ),
                                                Center(
                                                    child: !multiple ? Text(homeList[index].title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),)
                                                        : Text(homeList[index].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    splashColor: Colors.grey.withOpacity(0.2),
                                                    borderRadius:
                                                    const BorderRadius.all(Radius.circular(4.0)),
                                                    onTap: (){
                                                      Navigator.push<dynamic>(
                                                        context,
                                                        MaterialPageRoute<dynamic>(
                                                          builder: (BuildContext context) =>
                                                          homeList[index].navigateScreen!,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: multiple ? 2 : 1,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0,
                              childAspectRatio: 1.5,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'William On Hair',
                  style: TextStyle(
                    fontSize: 22,
                    color: isLightMode ? AppTheme.darkText : AppTheme.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: isLightMode ? Colors.transparent : AppTheme.nearlyBlack,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: isLightMode ? AppTheme.dark_grey : AppTheme.white,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key? key,
        this.legend,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);
  final HomeList? legend;
  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return
  }
}*/

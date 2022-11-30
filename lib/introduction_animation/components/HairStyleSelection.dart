import 'package:flutter/material.dart';

class HairStyleSelection extends StatefulWidget {
  final AnimationController animationController;

  const HairStyleSelection({Key? key, required this.animationController})
      : super(key: key);

  @override
  _HairStyleSelectionState createState() => _HairStyleSelectionState();
}

class _HairStyleSelectionState extends State<HairStyleSelection> with TickerProviderStateMixin {

  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _relaxFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _relaxSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.4,
        0.6,
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
              SlideTransition(
                position: _relaxFirstHalfAnimation,
                child: SlideTransition(
                  position: _relaxSecondHalfAnimation,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100, bottom: 50),
                    child: Text("Sélection de Coiffure",
                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))
                  )
                ),
              ),
              Expanded(
                  child: GridView(
                    padding: const EdgeInsets.only(
                        top: 0, left: 12, right: 12),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(
                      8,
                          (int index) {
                        final int count = 8;
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
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/240_F_265073366_wXcritZmlOMNsxq2DsgkiCJJeJ9p1eKo.jpeg"),
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                                              ),
                                              borderRadius: BorderRadius.circular(15),

                                              //border: Border.all(width: 3, color: Colors.grey)
                                            ),
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
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 1.5,
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

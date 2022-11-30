import 'package:flutter/material.dart';

import '../../app_theme.dart';

class BarberSelection extends StatefulWidget {
  final AnimationController animationController;

  const BarberSelection({Key? key, required this.animationController})
      : super(key: key);

  @override
  _BarberSelectionState createState() => _BarberSelectionState();
}

class _BarberSelectionState extends State<BarberSelection> with TickerProviderStateMixin {

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
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _textAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _relaxAnimation =
        Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
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
                position: _relaxAnimation,
                child: Text(
                  "Choix du Coiffeur",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      height: currentIndex == 1? 130 : 100,
                      width: currentIndex == 1? 130 : 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.grey.withOpacity(0.6),
                              offset: const Offset(2.0, 4.0),
                              blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset('assets/images/userImage.png'),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: currentIndex == 2? 130 : 100,
                      width: currentIndex == 2? 130 : 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.grey.withOpacity(0.6),
                              offset: const Offset(2.0, 4.0),
                              blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset('assets/images/photo_2022-11-25_01-12-07.jpg'),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: currentIndex == 3? 130 : 100,
                      width: currentIndex == 3? 130 : 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.grey.withOpacity(0.6),
                              offset: const Offset(2.0, 4.0),
                              blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset('assets/images/userImage.png'),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 25),
              SlideTransition(
                position: _imageAnimation,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: Column(
                    children: [
                      if(currentIndex == 1)...[
                        SlideTransition(
                            position: _secondHalfAnimation,
                          child: Column(
                            children: [
                              Text("Salomon",
                                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              const SizedBox(height: 15),
                              Image.asset(
                                'assets/images/240_F_216040804_7KrvZbbeILJH5okMQAkHv3kTZg3n5lH2.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ],
                          )
                        )
                      ]else if(currentIndex == 2)...[
                        SlideTransition(
                            position: _secondHalfAnimation,
                            child: Column(
                              children: [
                                Text("William",
                                    style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                                const SizedBox(height: 15),
                                Image.asset(
                                  'assets/images/240_F_216040804_7KrvZbbeILJH5okMQAkHv3kTZg3n5lH2.jpeg',
                                  fit: BoxFit.contain,
                                ),
                              ],
                            )
                        )
                      ]else if(currentIndex == 3)...[
                        SlideTransition(
                            position: _secondHalfAnimation,
                            child: Column(
                              children: [
                                Text("Shakib",
                                    style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                                const SizedBox(height: 15),
                                Image.asset(
                                  'assets/images/240_F_216040804_7KrvZbbeILJH5okMQAkHv3kTZg3n5lH2.jpeg',
                                  fit: BoxFit.contain,
                                ),
                              ],
                            )
                        )
                      ]else...[
                        SlideTransition(
                            position: _textAnimation,
                        child: Text("Choisir le coiffeur",style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center),
                        )
                      ]
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

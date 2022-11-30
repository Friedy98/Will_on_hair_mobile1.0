import 'package:flutter/material.dart';
import 'dart:io' as plateform;

class TopBackSkipView extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onBackClick;

  const TopBackSkipView({
    Key? key,
    required this.onBackClick,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0.0, 0.0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    // final _backAnimation =
    //     Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
    //         .animate(CurvedAnimation(
    //   parent: animationController,
    //   curve: Interval(
    //     0.6,
    //     0.8,
    //     curve: Curves.fastOutSlowIn,
    //   ),
    // ));
    return SlideTransition(
      position: _animation,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          height: 58,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SlideTransition(
                //   position: _backAnimation,
                //   child:
                IconButton(
                  onPressed: onBackClick,
                  icon: Icon(plateform.Platform.isIOS
                      ? Icons.arrow_back_ios
                      : Icons.arrow_back,
                  )
                  //   ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

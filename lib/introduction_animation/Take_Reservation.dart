import 'package:best_flutter_ui_templates/introduction_animation/components/HairStyleSelection.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/center_next_button.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/DateTimeSelection.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/BarberSelection.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/ServiceSelection.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/top_back_skip_view.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/ConfirmReservation.dart';
import 'package:flutter/material.dart';

class TakeReservation extends StatefulWidget {
  const TakeReservation({Key? key}) : super(key: key);

  @override
  _TakeReservationState createState() =>
      _TakeReservationState();
}

class _TakeReservationState
    extends State<TakeReservation> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: [
            ServiceSelection(
              animationController: _animationController!,
            ),
            BarberSelection(
              animationController: _animationController!,
            ),
            HairStyleSelection(
              animationController: _animationController!,
            ),
            DateTimeSelection(
              animationController: _animationController!,
            ),
            ConfirmReservation(
              animationController: _animationController!,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Navigator.pop(context);
  }
}

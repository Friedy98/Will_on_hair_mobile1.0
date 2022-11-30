import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Animation_Services/delayed_animation.dart';

class DateTimeSelection extends StatefulWidget {
  final AnimationController animationController;

  const DateTimeSelection({Key? key, required this.animationController})
      : super(key: key);

  @override
  _DateTimeSelectionState createState() => _DateTimeSelectionState();
}

class _DateTimeSelectionState extends State<DateTimeSelection> with TickerProviderStateMixin {

  Future _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 0)),
        lastDate: DateTime(2030));
    String formattedDate = DateFormat("EEEE-dd-MM-yyyy").format(pickedDate!);
    if(pickedDate != null ){
      setState(() {
        dateController.text = formattedDate; //set output date to TextField value.
      });
    }
  }

  Future timePicker()async{
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15),
    );
    if(newTime != null){
      setState(() {
        timeController.text = "${newTime.format(context)}";
      });
    }
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController telController = TextEditingController();
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _moodFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _moodSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageFirstHalfAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0))
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
          padding: const EdgeInsets.only(bottom: 100, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Date et Heure",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SlideTransition(
                position: _moodFirstHalfAnimation,
                child: SlideTransition(
                  position: _moodSecondHalfAnimation,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 64, right: 64, top: 16, bottom: 16),
                    child: Text(
                      "Bien vouloir confirmer la date et l'heure de votre rendez-vous",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SlideTransition(
                position: _imageSecondHalfAnimation,
                child: DelayedAnimation(
                    delay: 300,
                    child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'Définir une date',
                        labelText: 'Date de Rendez-Vous',
                        prefixIcon: Icon(Icons.calendar_today_rounded),
                      ),
                      onTap: (){
                        _selectDate();
                      },
                    )
                ),
              ),
              SlideTransition(
                position: _moodSecondHalfAnimation,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "à",style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: _imageFirstHalfAnimation,
                child: DelayedAnimation(
                    delay: 500,
                    child: TextFormField(
                      controller: timeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: '12:00',
                        labelText: 'Heure de Rendez-vous',
                        prefixIcon: Icon(Icons.timer_sharp),
                      ),
                      onTap: (){
                        timePicker();
                      },
                    )
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Votre Contact",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              SlideTransition(
                  position: _imageFirstHalfAnimation,
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    hintText: '032655333333',
                    labelText: 'Téléphone',
                    suffixIcon: const Icon(Icons.phone),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber;
                    telController.text = phoneNumber;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

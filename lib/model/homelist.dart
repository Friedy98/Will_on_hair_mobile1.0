import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/introduction_animation/Take_Reservation.dart';
import 'package:flutter/widgets.dart';

import '../design_course/Fidelity_card.dart';
import '../fitness_app/fitness_app_home_screen.dart';
import 'instagramPage.dart';
import 'location.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    required this.title
  });

  Widget? navigateScreen;
  String imagePath;
  String title;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/240_F_142999858_7EZ3JksoU3f4zly0MuY3uqoxhKdUwN5u.jpeg',
      navigateScreen: TakeReservation(),
      title: 'Prendre \nRendez-Vous'
    ),
    HomeList(
      imagePath: 'assets/images/240_F_480329143_udbywRAkIk8LObNgwFnLhWqbOyjenXca.jpeg',
      //navigateScreen: ,
      title: "Avis Clients"
    ),
    HomeList(
      imagePath: 'assets/images/240_F_163774420_stB9uyuZEodwTdSBaJKiybxDyl2FfqIN.jpeg',
      navigateScreen: FidelityCardScreen(),
      title: "Carte de Fidélité"
    ),
    HomeList(
      imagePath: 'assets/images/gallery2.jpeg',
      navigateScreen: InstagramPage(),
      title: "Gallery"
    ),
    HomeList(
      imagePath: 'assets/images/240_F_459165652_XG7N90pOALqtOIE6V4zC8bOkkXNGKpzv.jpeg',
      navigateScreen: Location(),
      title: "Localisation"
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
      navigateScreen: FitnessAppHomeScreen(),
      title: "Test Widget"
    ),
  ];
}

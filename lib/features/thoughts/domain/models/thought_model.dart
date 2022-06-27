import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

enum Mood {
  rainy,
  cloudy,
  sunny,
  shiny,
  rainbow,
}

const moodMap = {
  Mood.rainy: MaterialCommunityIcons.weather_pouring,
  Mood.cloudy: MaterialCommunityIcons.weather_cloudy,
  Mood.sunny: MaterialCommunityIcons.weather_partly_cloudy,
  Mood.shiny: Ionicons.sunny_outline,
  Mood.rainbow: Entypo.rainbow,
};

class Thought {
  const Thought({
    required this.title,
    required this.description,
    required this.mood,
    required this.createdAt,
  });
  final String title;
  final String description;
  final Mood mood;
  final DateTime createdAt;

  String get createdAtString => DateFormat().format(createdAt);

  IconData? get moodIcon {
    return moodMap[mood];
  }
}

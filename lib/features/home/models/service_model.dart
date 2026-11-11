import 'package:flutter/material.dart';

class ServiceModel {
  final String name;
  final String iconPath;
  final Color startColor;
  final Color endColor;

  const ServiceModel({
    required this.name,
    required this.iconPath,
    required this.startColor,
    required this.endColor,
  });
}

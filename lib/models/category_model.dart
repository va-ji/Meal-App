import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  const Category({
    this.color = Colors.blue,
    required this.id,
    required this.title,
  });
}

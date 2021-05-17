import 'package:flutter/material.dart';

class NCModel {
  final String name, image;
  final Color color;
  final Alignment align;

  NCModel(
      {this.align = Alignment.center,
      required this.name,
      required this.image,
      required this.color});
}

final ncData = <NCModel>[
  NCModel(
      name: 'Dark Black',
      image: 'assets/nc_assets/black.jpg',
      color: Colors.black,
      align: Alignment.topRight),
  NCModel(
      name: 'Ocean Blue',
      image: 'assets/nc_assets/blue.jpg',
      color: Colors.blue,
      align: Alignment.topRight),
  NCModel(
      name: 'Green Peace',
      image: 'assets/nc_assets/green.jpg',
      color: Colors.green,
      align: Alignment.centerLeft),
  NCModel(
      name: 'Caramel Pink',
      image: 'assets/nc_assets/pink.jpg',
      color: Colors.pink,
      align: Alignment.bottomLeft),
  NCModel(
      name: 'Disco Purple',
      image: 'assets/nc_assets/purple.jpg',
      color: Colors.purple,
      align: Alignment.bottomCenter),
  NCModel(
      name: 'Pasion Red',
      image: 'assets/nc_assets/red.jpg',
      color: Colors.red,
      align: Alignment.topRight),
  NCModel(
      name: 'Cloud White',
      image: 'assets/nc_assets/white.jpg',
      color: Colors.grey[200]!,
      align: Alignment.topCenter),
  NCModel(
      name: 'Sonrise Yellow',
      image: 'assets/nc_assets/yellow.jpg',
      color: Colors.yellow,
      align: Alignment.bottomLeft),
];

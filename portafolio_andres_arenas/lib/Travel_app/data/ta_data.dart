import 'package:flutter/material.dart';

class TAModel {
  final String title, image, location;
  final List<String> tags;
  final List<List<Color>> colors;

  TAModel(
      {required this.title,
      required this.image,
      required this.location,
      required this.tags,
      required this.colors});
}

List<List<Color>> colors = [
  [Colors.redAccent, Colors.red],
  [Colors.deepPurple, Colors.blue],
  [Colors.cyan, Colors.greenAccent],
  [Colors.yellowAccent, Colors.orange]
];

final List<TAModel> taData = <TAModel>[
  TAModel(
      image:
          'https://concepto.de/wp-content/uploads/2015/03/paisaje-e1549600034372.jpg',
      title: 'Valley Rose',
      location: 'Suiza',
      tags: ['Castle', 'Mountain', 'Valley', 'Ocean'],
      colors: colors),
  TAModel(
      image:
          'https://www.liligo.es/magazine-viajes/wp-content/uploads/sites/43/2015/03/noruega-geirangerfjord.jpg',
      title: 'Mountain',
      location: 'Noruega',
      tags: ['Castle', 'Mountain', 'Valley', 'Ocean'],
      colors: colors),
  TAModel(
      image:
          'https://i1.wp.com/kamaleon.viajes/wp-content/uploads/2017/11/MQF1720.jpg?resize=970%2C644',
      title: 'Mountains',
      location: 'Finlandia',
      tags: ['Castle', 'Mountain', 'Valley', 'Ocean'],
      colors: colors),
];

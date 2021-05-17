import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:portafolio_andres_arenas/nike_colors/data/nc_model.dart';

class NCHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;

  late NCModel current = ncData.first;
  late NCModel past = ncData.last;

  onNCSelected(NCModel nc) {
    current = nc;
    update();
    animationController.forward(from: 0.0).whenComplete(() {
      past = current;
      update();
    });
  }

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      upperBound: 3.2,
      duration: const Duration(milliseconds: 520),
    );
    super.onInit();
  }
}

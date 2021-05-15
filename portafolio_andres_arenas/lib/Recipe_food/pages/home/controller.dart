import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio_andres_arenas/Recipe_food/pages/home/rf_home.dart';

class RFHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: pages.length, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final List<Tuple> pages = [
    Tuple(title: 'Submited', body: SubmitedBody()),
    Tuple(title: 'Reviews', body: ReviewsBody()),
  ];
}

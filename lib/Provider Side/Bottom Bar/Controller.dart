import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Dashboard/DashBoard.dart';
import '../Earning/Earning.dart';
import '../Jobs/Jobs.dart';
import '../Profile/Profile.dart';

class Controller extends GetxController{
  var currentIndex = 0.obs;
  late PageController pageController;
  late List<Widget> pages;

  void onInit(){
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    pages=[
      Dashboard(),
      Jobs(),
      Earning(),
      Profile(),
    ];
  }
  void changePage(int index){
    if(currentIndex.value==index)return;
    pageController.animateToPage(
        index,
        duration:Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  void onPageChanged(int index){
    currentIndex.value=index;
  }
  void onClosed(){
    pageController.dispose();
    super.onClose();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Booking/Booking.dart';
import 'package:serviq/Home%20Page/Home/Home.dart';
import 'package:serviq/Profile/Profile.dart';
import 'package:serviq/Wallet/Wallet.dart';

class Controller extends GetxController{
  var currentIndex = 0.obs;
  late PageController pageController;
  late List<Widget> pages;

  void onInit(){
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    pages=[
    Home(),
    Booking(),
    Wallet(),
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
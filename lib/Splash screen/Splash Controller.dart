import 'package:get/get.dart';
import 'package:serviq/On%20Boarding/On%20boarding.dart';

class Splash_controller  extends GetxController {
  @override
  void onInit(){
    super.onInit();
    navigateToOnBoarding();
  }
  void navigateToOnBoarding(){
    print('Navigating to On Boarding');
    Future.delayed(const Duration(seconds: 3),(){
     Get.to(On_Boarding());
    });
  }
}
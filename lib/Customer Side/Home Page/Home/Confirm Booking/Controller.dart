import 'package:get/get.dart';

class ConfirmController extends GetxController {
  var isCard = false.obs;
  var isCash = false.obs;
  var isOther = false.obs;
  var isLoading = false.obs;

  void toggleCard(bool value) {
    if (value) {
      isCard.value = true;
      isCash.value = false;
      isOther.value = false;
    }
  }

  void toggleCash(bool value) {
    if (value) {
      isCash.value = true;
      isCard.value = false;
      isOther.value = false;
    }
  }

  void toggleOther(bool value) {
    if (value) {
      isOther.value = true;
      isCard.value = false;
      isCash.value = false;
    }
  }

  String getPaymentMethod() {
    if (isCard.value) return 'Credit/Debit Card';
    if (isCash.value) return 'Cash at Arrival';
    if (isOther.value) return 'Online Banking';
    return 'Not Selected';
  }
}
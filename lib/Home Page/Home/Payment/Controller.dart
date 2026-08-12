import 'package:get/get.dart';
import '../../Model/Model.dart';

class PaymentController extends GetxController {
  var isCard = false.obs;
  var isWallet = false.obs;
  var isLoading = false.obs;

  var platformFee = 3.00.obs;
  var tax = 3.00.obs;
  var discount = 3.00.obs;

  late Model model;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Model) {
      model = Get.arguments as Model;
    }
  }

  void initModel(Model model) {
    this.model = model;
    update();
  }

  double get totalAmount {
    double price = 0.0;
    if (model.price != null && model.price!.isNotEmpty) {
      String cleanPrice = model.price!.replaceAll('\$', '').replaceAll(',', '').trim();
      price = double.tryParse(cleanPrice) ?? 0.0;
    }
    return price + platformFee.value + tax.value - discount.value;
  }

  String get formattedTotal => totalAmount.toStringAsFixed(2);

  void toggleCard(bool value) {
    if (value) {
      isCard.value = true;
      isWallet.value = false;
    }
  }

  void toggleWallet(bool value) {
    if (value) {
      isWallet.value = true;
      isCard.value = false;
    }
  }

  String getPaymentMethod() {
    if (isCard.value) return 'Credit/Debit Card';
    if (isWallet.value) return 'Cash at Arrival';
    return 'Not Selected';
  }

  @override
  void onClose() {
    super.onClose();
  }
}
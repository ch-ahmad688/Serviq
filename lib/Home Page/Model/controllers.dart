import 'package:get/get.dart';
import 'Model.dart';

class HomeController extends GetxController {
  final List<Model> categories = [
    Model(id: '1', image: 'assets/Icon/medical-app.png', name: 'Electrician', category: 'Electrician'),
    Model(id: '2', image: 'assets/Icon/plumber.png', name: 'Plumber', category: 'Plumber'),
    Model(id: '3', image: 'assets/Icon/air-conditioning.png', name: 'AC Repair', category: 'AC Repair'),
    Model(id: '4', image: 'assets/Icon/wrench.png', name: 'Mechanic', category: 'Mechanic'),
    Model(id: '5', image: 'assets/Icon/cleaning.png', name: 'Cleaning', category: 'Cleaning'),
    Model(id: '6', image: 'assets/Icon/painter.png', name: 'Painter', category: 'Painter'),
    Model(id: '7', image: 'assets/Icon/carpenter.png', name: 'Carpenter', category: 'Carpenter'),
    Model(id: '8', image: 'assets/Icon/household-appliance.png', name: 'Appliance', category: 'Appliance'),
  ];
}

class CategoryController extends GetxController {
  final List<Model> model = [
    Model(id: '1', image: 'assets/Icon/medical-app.png', name: 'Electrician', price: "Started from \$25"),
    Model(id: '2', image: 'assets/Icon/plumber.png', name: 'Plumber', price: "Started from \$30"),
    Model(id: '3', image: 'assets/Icon/air-conditioning.png', name: 'AC Repair', price: "Started from \$40"),
    Model(id: '4', image: 'assets/Icon/wrench.png', name: 'Mechanic', price: "Started from \$35"),
    Model(id: '5', image: 'assets/Icon/cleaning.png', name: 'Cleaning', price: "Started from \$20"),
    Model(id: '6', image: 'assets/Icon/painter.png', name: 'Painter', price: "Started from \$50"),
    Model(id: '7', image: 'assets/Icon/carpenter.png', name: 'Carpenter', price: "Started from \$45"),
    Model(id: '8', image: 'assets/Icon/household-appliance.png', name: 'Appliance', price: "Started from \$38"),
  ];

  Model getModelById(String id) {
    return model.firstWhere((m) => m.id == id);
  }
}

class ElectricianController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'Electrician'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'Electrician'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'Electrician'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'Electrician'),
  ];
}

class PlumberController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'Plumber'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'Plumber'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'Plumber'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'Plumber'),
  ];
}

class ACController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'AC Repair'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'AC Repair'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'AC Repair'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'AC Repair'),
  ];
}

class MechanicController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'Mechanic'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'Mechanic'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'Mechanic'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'Mechanic'),
  ];
}

class CleaningController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'Cleaning'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'Cleaning'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'Cleaning'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'Cleaning'),
  ];
}

class PainterController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'Painter'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'Painter'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'Painter'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'Painter'),
  ];
}

class CarpenterController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'Carpenter'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'Carpenter'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'Carpenter'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'Carpenter'),
  ];
}

class ApplianceController extends GetxController {
  final List<Model> professionals = [
    Model(id: '1', image: 'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller', price: '\$25', rating: '4.5', category: 'Appliance'),
    Model(id: '2', image: 'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink', price: '\$30', rating: '4.6', category: 'Appliance'),
    Model(id: '3', image: 'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson', price: '\$40', rating: '4.7', category: 'Appliance'),
    Model(id: '4', image: 'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq', price: '\$35', rating: '4.8', category: 'Appliance'),
  ];
}

class DetailController extends GetxController with GetTickerProviderStateMixin {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
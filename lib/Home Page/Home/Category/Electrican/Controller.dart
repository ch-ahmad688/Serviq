import 'package:get/get.dart';

import 'Model.dart';


class ElectricianController extends GetxController{
  final List<Model> model=[
    Model(
        id: '1',
        image:'assets/images/021bc82fde59c4aae19e749714143051f4ef71f0.png',
        name: 'David Miller',
        price: "\$25",
        rating: '4.5'
    ),

    Model(
        id: '2',
        image:'assets/images/WhatsApp Image 2026-08-05 at 11.05.12 AM.jpeg',
        name: 'Sadie Sink',
        price: "\$30",
        rating: '4.6'

    ),
    Model(
        id: '3',
        image:'assets/images/9fa492644538aeb8fa7ffd83195864e66d955fde.png',
        name: 'James Wilson',
        price: "\$40",
        rating: '4.7'

    ),
    Model(
        id: '4',
        image:'assets/images/0c26d887ed060b47018885c4c6847048f8a83758.png',
        name: 'Omar Farooq',
        price: "\$35",
        rating: '4.8'

    ),
  ];
  Model getModelById(String id) {
    return model.firstWhere((m) => m.id == id);
  }
}
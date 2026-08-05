import 'package:get/get.dart';

import 'Model.dart';


class CategoryController extends GetxController{
  final List<Model> model=[
    Model(
        id: '1',
        image:'assets/Icon/medical-app.png',
        name: 'Electrician',
        price: "Started form \$25"
    ),

    Model(
        id: '2',
        image:'assets/Icon/plumber.png',
        name: 'Plumber',
        price: "Started form \$30"
    ),
    Model(
        id: '3',
        image:'assets/Icon/air-conditioning.png',
        name: 'AC Repair',
        price: "Started form \$40"
    ),
    Model(
        id: '4',
        image:'assets/Icon/wrench.png',
        name: 'Mechanic',
        price: "Started form \$35"
    ),
    Model(
        id: '5',
        image:'assets/Icon/cleaning.png',
        name: 'Cleaning',
        price: "Started form \$20"
    ),
    Model(
        id: '6',
        image:'assets/Icon/painter.png',
        name: 'Painter',
        price: "Started form \$50"
    ),
    Model(
        id: '1',
        image:'assets/Icon/carpenter.png',
        name: 'Carpenter',
        price: "Started form \$45"
    ),
    Model(
        id: '1',
        image:'assets/Icon/household-appliance.png',
        name: 'Appliance',
        price: "Started form \$38"
    ),
  ];
  Model getModelById(String id) {
    return model.firstWhere((m) => m.id == id);
  }
}
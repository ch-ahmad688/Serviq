import 'package:get/get.dart';
import 'package:serviq/Home%20Page/Home/Model.dart';

class HomeController extends GetxController{
 final List<Model> model=[
   Model(
     id: '1',
     image:'assets/Icon/medical-app.png',
     name: 'Electrician'),

   Model(
       id: '2',
       image:'assets/Icon/plumber.png',
       name: 'Plumber'),
   Model(
       id: '3',
       image:'assets/Icon/air-conditioning.png',
       name: 'AC Repair'),
   Model(
       id: '4',
       image:'assets/Icon/wrench.png',
       name: 'Mechanic'),
   Model(
       id: '5',
       image:'assets/Icon/cleaning.png',
       name: 'Cleaning'),
   Model(
       id: '6',
       image:'assets/Icon/painter.png',
       name: 'Painter'),
   Model(
       id: '1',
       image:'assets/Icon/carpenter.png',
       name: 'Carpenter'),
   Model(
       id: '1',
       image:'assets/Icon/household-appliance.png',
       name: 'Appliance'),
 ];
    Model getModelById(String id) {
      return model.firstWhere((m) => m.id == id);
    }
}
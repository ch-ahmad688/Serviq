import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Customer%20Side/Home%20Page/Model/Model.dart';
import '../Payment/Payment.dart';
import 'Controller.dart';

class Appointment extends StatelessWidget {
  final Model selectedModel;
  const Appointment({
    super.key,
    required this.selectedModel,
  });

  @override
  Widget build(BuildContext context) {
    final AppointmentController controller = Get.put(AppointmentController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomHeader(),
            Expanded(
              child: _buildBody(controller),
            ),
            _buildFixedBottomButton(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: const Color(0xffDFE4E9),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: 'Select date & time\n',
                  ),
                  TextSpan(
                    text: selectedModel.name,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff616D7D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(AppointmentController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _buildDaySection(controller),
          const SizedBox(height: 20),
          _buildTimeSlotSection(controller),
          const SizedBox(height: 16),
          _buildLocationContainer(),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget _buildDaySection(AppointmentController controller) {
    final List<DateTime> days = controller.days;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Select Day',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GetBuilder<AppointmentController>(
          builder: (controller) {
            return SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final bool isSelected = controller.selectedDayIndex == index;
                  return GestureDetector(
                    onTap: () {
                      controller.selectDay(index);
                    },
                    child: Container(
                      width: 65,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue.shade700
                            : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue.shade700
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                        boxShadow: isSelected
                            ? [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                            : null,
                      ),
                      child: _buildDayContent(
                        days[index],
                        isSelected,
                        controller,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDayContent(
      DateTime day,
      bool isSelected,
      AppointmentController controller,
      ) {
    final String dayName = controller.getDayName(day.weekday);
    final String dayDate = day.day.toString();
    final String monthName = controller.getMonthName(day.month);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dayName,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          dayDate,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
        Text(
          monthName,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? Colors.white70 : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlotSection(AppointmentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Time Slot',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        GetBuilder<AppointmentController>(
          builder: (controller) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: controller.timeSlots.length,
              itemBuilder: (context, index) {
                final bool isSelected = controller.selectedTimeIndex == index;
                return GestureDetector(
                  onTap: () {
                    controller.selectTime(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.blue.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? Colors.blue.shade700
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        controller.timeSlots[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildLocationContainer() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Text(
                    'Service address',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded,color: Color(0xff3D99E4),size: 16,),
                    Text(
                      '221B Baker Street, Apt 4, London',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFixedBottomButton(AppointmentController controller) {
    return GetBuilder<AppointmentController>(
      builder: (controller) {
        final DateTime selectedDay = controller.selectedDay;
        final String dayName = controller.getDayName(selectedDay.weekday);
        final String dayDate = selectedDay.day.toString();
        final String monthName = controller.getMonthName(selectedDay.month);
        final String selectedTime = controller.selectedTime;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, -3),
              ),
            ],
            border: const Border(
              top: BorderSide(
                color: Color(0xffDADEE5),
                width: 1.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Selected Slot',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff707B89),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$dayName, $dayDate $monthName',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0B6EBB),
                      ),
                    ),
                    Text(
                      selectedTime,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0B6EBB),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(Payment(model:selectedModel));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0B6EBB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Proceed to payment',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
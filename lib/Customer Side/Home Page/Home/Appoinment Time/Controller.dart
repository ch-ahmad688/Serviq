import 'package:get/get.dart';

class AppointmentController extends GetxController {
  int selectedDayIndex = 0;
  int selectedTimeIndex = 0;

  final List<String> timeSlots = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
  ];

  late List<DateTime> _cachedDays;

  @override
  void onInit() {
    super.onInit();
    _cachedDays = getDays();
  }

  List<DateTime> getDays() {
    final DateTime now = DateTime.now();
    return List.generate(
      7,
          (index) => now.add(Duration(days: index)),
    );
  }

  List<DateTime> get days => _cachedDays;

  void selectDay(int index) {
    if (index >= 0 && index < _cachedDays.length) {
      selectedDayIndex = index;
      update(); // Notify GetBuilder to rebuild
    }
  }

  void selectTime(int index) {
    if (index >= 0 && index < timeSlots.length) {
      selectedTimeIndex = index;
      update(); // Notify GetBuilder to rebuild
    }
  }

  String getDayName(int weekday) {
    const List<String> days = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    return days[weekday - 1];
  }

  String getMonthName(int month) {
    const List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  DateTime get selectedDay {
    return _cachedDays[selectedDayIndex];
  }

  String get selectedTime {
    return timeSlots[selectedTimeIndex];
  }
}
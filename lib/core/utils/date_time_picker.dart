
import '../router/export.dart';

class DateTimePicker {
  static void datePicker(
      {required BuildContext context,
      required Function(DateTime?) onPickedDate,
      DateTime? selectedDate,
      DateTime? firstDate,
      DateTime? maxDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? firstDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: maxDate ?? DateTime(2090),
    );
    if (pickedDate != null) {
      onPickedDate.call(pickedDate);
    }
  }

  static Future<bool> dateTimePicker(
      {required BuildContext context,
      required Function(DateTime?) onPickedDate,
      DateTime? selectedDate,
      DateTime? firstDate,
      DateTime? maxDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: maxDate ?? DateTime(2090),
    );
    if (pickedDate != null) {
      onPickedDate.call(pickedDate);
      return true;
    }
    return false;
  }

  static void timePicker(
      {required BuildContext context,
      required Function(TimeOfDay?) onPickedTime,
      TimeOfDay? selectedTime,
      bool? is24Hours,
      bool? isDateToday}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      builder: (context, child) {
        if (is24Hours == true) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        } else {
          return child!;
        }
      },
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );

    if (pickedTime != null) {
      // Get the current time
      final now = TimeOfDay.now();

      // Check if the picked time is after the current time
      if ((pickedTime.hour > now.hour || (pickedTime.hour == now.hour && pickedTime.minute > now.minute)) &&
          (isDateToday ?? false)) {
        // Show an error message (e.g., using SnackBar)
        showSnackBar("Time cannot be in the future.", SnackType.failed);
      } else {
        // Call the onPickedTime callback if the time is valid
        onPickedTime.call(pickedTime);
      }
    }
  }

  static bool checkTimes(BuildContext context, TimeOfDay? inTime, TimeOfDay? outTime) {
    if (inTime != null && outTime != null) {
      if (outTime.hour < inTime.hour || (outTime.hour == inTime.hour && outTime.minute < inTime.minute)) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
}

import 'package:intl/intl.dart';

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String formattedDate = DateFormat('MMM dd, yyyy').format(date);
  return formattedDate;
}

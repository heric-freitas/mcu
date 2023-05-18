extension DateFormatter on String {
  String get formatterDatePTBR {
    final dateSplit = split('-');
    final day = dateSplit[2];
    final month = dateSplit[1];
    final year = dateSplit[0];
    return '$day/$month/$year';
  }
}

extension DateTimeFormatter on DateTime {
   String get formatterDatePTBR {
    return '$day/$month/$year';
  } 
}
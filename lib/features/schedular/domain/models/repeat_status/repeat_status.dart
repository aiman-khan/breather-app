enum RepeatStatus {
  once,
  daily,
  monToFri,
  satSun,
  custom;

  String get name {
    if (this == once) {
      return 'Once';
    } else if (this == daily) {
      return 'Daily';
    } else if (this == satSun) {
      return 'Sat and Sun';
    } else if (this == monToFri) {
      return 'Monday to Fri';
    } else {
      return 'Custom';
    }
  }
}

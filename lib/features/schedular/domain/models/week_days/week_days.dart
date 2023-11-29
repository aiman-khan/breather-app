enum WeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  String get name {
    if (this == monday) {
      return 'Monday';
    } else if (this == tuesday) {
      return 'Tuesday';
    } else if (this == wednesday) {
      return 'Wednesday';
    } else if (this == thursday) {
      return 'Thursday';
    } else if (this == friday) {
      return 'Friday';
    } else if (this == saturday) {
      return 'Saturday';
    } else {
      return 'Sunday';
    }
  }
}

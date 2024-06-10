class Course {
  final int? ID;
  final String name;
  final String teacher;
  final String week;
  final String time;
  final String classroom;

  Course({
    this.ID,
    required this.name,
    required this.teacher,
    required this.classroom,
    required this.time,
    required this.week,
  });
}

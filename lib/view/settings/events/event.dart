class Event {
  final String name;
  final String date;
  final String time;
  final String budget;

  Event({
    required this.name,
    required this.date,
    required this.time,
    required this.budget,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'date': date,
        'time': time,
        'budget': budget,
      };

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        name: json['name'],
        date: json['date'],
        time: json['time'],
        budget: json['budget'],
      );
}

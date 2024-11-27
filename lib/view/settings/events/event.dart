import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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

class BlocScreen extends StatefulWidget {
  final String blocer;

  BlocScreen({
    required this.blocer,
  });

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(widget.blocer),
          ),
        ),
      ),
    );
  }
}

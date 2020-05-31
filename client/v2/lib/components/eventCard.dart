import '../models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  
  EventCard(this.event);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Text("SMH"),
        color: MediaQuery.of(context).platformBrightness == Brightness.light?Colors.grey[200]:Colors.grey[700]
      ),
    );
  }
}
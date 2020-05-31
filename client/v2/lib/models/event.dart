import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String name;
  final String imagePath;
  final int price;
  final String description;
  final String owner;
  final List tags;

  Event({
    @required this.id,
    @required this.name,
    @required this.imagePath,
    @required this.price,
    @required this.description,
    @required this.owner,
    @required this.tags,
  });

  factory Event.fromJSON(Map eventMap) {
    return Event(
      id: eventMap['id'],
      name: eventMap['name'],
      description: eventMap['description'],
      imagePath: eventMap['imagePath'],
      owner: eventMap['owner'],
      price: eventMap['price'],
      tags: eventMap['tags'],
    );
  }
}

import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String name;
  final String imageLink;
  final int price;
  final String description;
  final String artistID;

  Event({
    @required this.id,
    @required this.name,
    @required this.imageLink,
    @required this.price,
    @required this.description,
    @required this.artistID,
  });
}

import 'package:flutter/cupertino.dart';

import '../models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard(this.event);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: 125,
          width: MediaQuery.of(context).size.width - 32,
          child: FlatButton(
            color: CupertinoColors.systemGrey5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    event.imagePath,
                    height: 125,
                    width: 125,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 26,
                        child: Text(
                          event.name,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          event.description,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        width:
                            MediaQuery.of(context).size.width - 32 - 125 - 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
